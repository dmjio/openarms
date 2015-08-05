DROP TABLE attendees, users, needs, attendee_needs, roles, sessions, attendee_sessions, attendee_notes cascade;

/* Plugin for UUIDs */
CREATE EXTENSION "uuid-ossp";

/* Roles for system users */
CREATE TABLE roles (
  role_name VARCHAR(80) UNIQUE NOT NULL
);

/* System users table, for logging in/out, new user registration etc */
CREATE TABLE users (
  id          SERIAL PRIMARY KEY
, email       VARCHAR(80) UNIQUE
, password    VARCHAR(80) NOT NULL
, user_role   VARCHAR(80) UNIQUE NOT NULL REFERENCES roles(role_name) 
, reset_id    UUID NOT NULL DEFAULT uuid_generate_v4()
, created     TIMESTAMP NOT NULL
, last_login  TIMESTAMP NOT NULL
, login_count INTEGER NOT NULL
, active      BOOLEAN DEFAULT FALSE
, deleted     BOOLEAN DEFAULT FALSE
);

/* System users table, for tracking who logs in/logs out of our system */
CREATE TABLE user_sessions (
  id          SERIAL PRIMARY KEY
, user_id     SERIAL REFERENCES users(id)
, created     TIMESTAMP NOT NULL
, ended       TIMESTAMP NULL
);

/* Attendee table */
CREATE TABLE attendees (
  id             SERIAL PRIMARY KEY 
, email          VARCHAR(80) 
, first_name     VARCHAR(20) 
, middle_initial CHAR(1) 
, last_name      VARCHAR(20) 
, nickname       VARCHAR(20) 
, age            SMALLINT
, dob            DATE 
, deleted        BOOLEAN DEFAULT FALSE
, created        TIMESTAMP NOT NULL
, confidential   VARCHAR(2500) NULL
);

/* Attendee notes, notes on an attendee */
CREATE TABLE attendee_notes (
  id           SERIAL PRIMARY KEY
, attendee_id  SERIAL REFERENCES attendees(id)
, created_by   SERIAL REFERENCES users(id)
, note         VARCHAR(500) 
, created      TIMESTAMP NOT NULL
, deleted      BOOLEAN   DEFAULT FALSE
);

/* Session information */
CREATE TABLE sessions (
  id           SERIAL PRIMARY KEY 
, session_day  DATE NOT NULL UNIQUE DEFAULT CURRENT_DATE
, meals_served INT 
);

/* Tracks the check in/check out session info for a given attendee */
CREATE TABLE attendee_sessions (
  id          SERIAL PRIMARY KEY 
, attendee_id SERIAL REFERENCES attendees(id)
, session_id  SERIAL REFERENCES sessions(id)
, check_in    TIMESTAMP NOT NULL
, check_out   TIMESTAMP NULL
, dob         DATE NOT NULL
);

/* Items to be received by an attendee */
CREATE TABLE items (
  id        SERIAL PRIMARY KEY 
, item_name VARCHAR(200) UNIQUE NOT NULL
);

/* When an attendee received something */
CREATE TABLE attendee_session_items (
  id          SERIAL PRIMARY KEY 
, attendee_id SERIAL REFERENCES attendees(id)
, session_id  SERIAL REFERENCES sessions(id)
, item SERIAL REFERENCES items(id)
, received    TIMESTAMP
);

/* Needs to be selected by a user and tracked for an attendee */
CREATE TABLE needs (
  id   SERIAL PRIMARY KEY 
, need VARCHAR(200) UNIQUE NOT NULL
);

/* Needs by attendee */
CREATE TABLE attendee_needs (
   attendee_id SERIAL UNIQUE REFERENCES attendees(id)
 , need_id     SERIAL UNIQUE REFERENCES needs(id)
);
