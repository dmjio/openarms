{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Attendee 
       ( -- * Types
         Attendee (..)
       , columnOffsetsAttendee
       , tableOfAttendee
       , attendee
       , insertAttendee
       , insertQueryAttendee
       , selectAttendee
       , updateAttendee
       , fromSqlOfAttendee
       , toSqlOfAttendee
       , id'
       , email'
       , firstName'
       , middleInitial'
       , lastName'
       , nickname'
       , age'
       , lang'
       , mail'
       , deceasedDate'
       , dob'
       , deleted'
       , created'
       , status'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
import Data.Aeson
------------------------------------------------------------------------------
$(defineTable "attendee")
------------------------------------------------------------------------------
instance ToJSON Attendee where
  toJSON Attendee {..} = object [
      "id"             .= id
    , "email"          .= email
    , "first_name"     .= firstName
    , "last_name"      .= lastName
    , "middle_initial" .= middleInitial
    , "nickname"       .= nickname
    , "age"            .= age
    , "lang"           .= lang
    , "mail"           .= mail
    , "deceased_date"  .= deceasedDate
    , "dob"            .= dob
    , "deleted"        .= deleted
    , "created"        .= created
    , "status"         .= status
    ]
