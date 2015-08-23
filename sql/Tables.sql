CREATE SCHEMA openarms;

-- DROP TABLE openarms.attendees, openarms.user_account, openarms.need, openarms.attendee_need, openarms.user_role, openarms.session, openarms.attendee_session, openarms.attendee_note, openarms.attendee_document, openarms.attendee_photo, openarms.attendee_session_item, openarms.encounter, openarms.item, openarms.lang, openarms.status, openarms.user_session openarms.attendee_private_notes cascade;

/* Plugin for UUIDs */
CREATE EXTENSION "uuid-ossp";

/* Roles for system users */
CREATE TABLE OpenArms.user_role (
  role_name VARCHAR(80) PRIMARY KEY UNIQUE NOT NULL
);
/* System users table, for logging in/out, new user registration etc */
CREATE TABLE OpenArms.user_account (
  id          SERIAL PRIMARY KEY
, email       VARCHAR(80) UNIQUE
, password    VARCHAR(80) NOT NULL
, user_role   VARCHAR(80) UNIQUE NOT NULL REFERENCES OpenArms.user_role(role_name) 
, reset_id    UUID NOT NULL DEFAULT uuid_generate_v4()
, created     TIMESTAMP NOT NULL
, last_login  TIMESTAMP NOT NULL
, login_count INTEGER NOT NULL 
, active      BOOLEAN NOT NULL DEFAULT FALSE
, deleted     BOOLEAN NOT NULL DEFAULT FALSE
);

/* System users table, for tracking who logs in/logs out of our system */
CREATE TABLE OpenArms.user_session (
  id          SERIAL PRIMARY KEY
, user_id     SERIAL REFERENCES OpenArms.user_account(id)
, created     TIMESTAMP NOT NULL
, expiration  TIMESTAMP NOT NULL
, active      BOOLEAN NOT NULL DEFAULT True
);

/* Preferred Langauges */
CREATE TABLE OpenArms.lang (
  id          SERIAL PRIMARY KEY
, name        VARCHAR(50) UNIQUE NOT NULL
);

/* status.. homeless status? */ 
CREATE TABLE OpenArms.status (
  id             SERIAL PRIMARY KEY 
, name           VARCHAR(80) UNIQUE NOT NULL
);

/* Attendee table */
CREATE TABLE OpenArms.attendee (
  id             SERIAL PRIMARY KEY 
, email          VARCHAR(80) 
, first_name     VARCHAR(20) 
, middle_initial CHAR(1) 
, last_name      VARCHAR(20) 
, nickname       VARCHAR(20) 
, age            SMALLINT
, lang           SERIAL REFERENCES OpenArms.lang(id)
, mail           BOOLEAN DEFAULT FALSE
, deceased_date  DATE
, dob            DATE 
, deleted        BOOLEAN DEFAULT FALSE
, created        TIMESTAMP NOT NULL
, status         SERIAL REFERENCES OpenArms.status(id)
);

/* Mapping of an attendees to file name, tracks uploads, only one photo allowed */
CREATE TABLE OpenArms.attendee_photo (
  id           SERIAL PRIMARY KEY
, attendee_id  SERIAL UNIQUE REFERENCES OpenArms.attendee(id)
, created      TIMESTAMP NOT NULL
, file_name    VARCHAR(100) NOT NULL
);

/* Mapping of an attendees to file name, tracks uploads of documents  */
CREATE TABLE OpenArms.attendee_document (
  id           SERIAL PRIMARY KEY
, attendee_id  SERIAL REFERENCES OpenArms.attendee(id)
, created      TIMESTAMP NOT NULL
, file_name    VARCHAR(100) NOT NULL
);

/* Attendee notes, notes on an attendee */
CREATE TABLE OpenArms.attendee_note (
  id           SERIAL PRIMARY KEY
, attendee_id  SERIAL REFERENCES OpenArms.attendee(id)
, created_by   SERIAL REFERENCES OpenArms.user_account(id)
, note         VARCHAR(500) 
, created      TIMESTAMP NOT NULL
, deleted      BOOLEAN   DEFAULT FALSE
);
/* Attendee notes, notes on an attendee */
CREATE TABLE OpenArms.attendee_private_note (
  id           SERIAL PRIMARY KEY
, attendee_id  SERIAL REFERENCES OpenArms.attendee(id)
, created_by   SERIAL REFERENCES OpenArms.user_account(id)
, note         VARCHAR(500) 
, created      TIMESTAMP NOT NULL
, deleted      BOOLEAN   DEFAULT FALSE
);
/* Session information */
CREATE TABLE OpenArms.session (
  id           SERIAL PRIMARY KEY 
, session_day  DATE NOT NULL UNIQUE DEFAULT CURRENT_DATE
, meals_served INT 
);
/* Tracks the check in/check out session info for a given attendee */
CREATE TABLE OpenArms.attendee_session (
  id          SERIAL PRIMARY KEY 
, attendee_id SERIAL REFERENCES OpenArms.attendee(id)
, session_id  SERIAL REFERENCES OpenArms.session(id)
, check_in    TIMESTAMP NOT NULL
, check_out   TIMESTAMP NULL
);
/* Items to be received by an attendee */
CREATE TABLE OpenArms.item (
  id        SERIAL PRIMARY KEY 
, name      VARCHAR(200) UNIQUE NOT NULL
, special   BOOLEAN DEFAULT FALSE
);

/* When an attendee received something */
CREATE TABLE OpenArms.attendee_session_item (
  id          SERIAL PRIMARY KEY 
, attendee_id SERIAL REFERENCES OpenArms.attendee(id)
, session_id  SERIAL REFERENCES OpenArms.session(id)
, item_id     SERIAL REFERENCES OpenArms.item(id)
, received    TIMESTAMP
);

/* Needs to be selected by a user and tracked for an attendee */
CREATE TABLE OpenArms.need (
  id   SERIAL PRIMARY KEY 
, name VARCHAR(200) UNIQUE NOT NULL
);

/* Needs by attendee */
CREATE TABLE OpenArms.attendee_need (
   id SERIAL PRIMARY KEY
 , attendee_id SERIAL UNIQUE REFERENCES OpenArms.attendee(id)
 , need_id     SERIAL UNIQUE REFERENCES OpenArms.need(id)
);

/* Needs by attendee */
CREATE TABLE OpenArms.encounter (
   id           SERIAL PRIMARY KEY 
,  attendee_id  SERIAL UNIQUE REFERENCES OpenArms.attendee(id)
,  session_id   SERIAL UNIQUE REFERENCES OpenArms.session(id)
,  created      TIMESTAMP NOT NULL
);
/* for HUD or HHS */
CREATE TYPE OpenArms.homeless_status AS ENUM ('HHS', 'HUD');

/* for chronic */
CREATE TYPE OpenArms.homeless_type AS ENUM ('episodic', 'chronic');

-- INSERT INTO Attendees
-- (
--  email
-- , first_name
-- , middle_initial
-- , last_name     
-- , nickname      
-- , age           
-- , lang          
-- , mail          
-- , deceased_date 
-- , dob           
-- , deleted       
-- , created       
-- , status        
-- )
-- VALUES (
--    'djohnson.m@gmail.com'
-- ,  'foo'
-- ,  'a'
-- ,  'bar'
-- ,  'foobar'
-- ,  27
-- ,  1
-- ,  true
-- ,  NULL
-- ,  '09/16/1987'
-- ,  false
-- ,  (select current_date)
-- , 1
-- );
