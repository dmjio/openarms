{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module AttendeeDocument 
       ( -- * Types
         AttendeeDocument (..)
       , columnOffsetsAttendeeDocument
       , tableOfAttendeeDocument
       , attendeeDocument
       , insertAttendeeDocument
       , insertQueryAttendeeDocument
       , selectAttendeeDocument
       , updateAttendeeDocument
       , fromSqlOfAttendeeDocument
       , toSqlOfAttendeeDocument
       , id'
       , attendeeId'
       , created'
       , fileName'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "attendee_document")
