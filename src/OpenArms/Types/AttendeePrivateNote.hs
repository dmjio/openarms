{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.AttendeePrivateNote 
       ( -- * Types
         AttendeePrivateNote (..)
       , columnOffsetsAttendeePrivateNote
       , tableOfAttendeePrivateNote
       , attendeePrivateNote
       , insertAttendeePrivateNote
       , insertQueryAttendeePrivateNote
       , selectAttendeePrivateNote
       , updateAttendeePrivateNote
       , fromSqlOfAttendeePrivateNote
       , toSqlOfAttendeePrivateNote
       , id'
       , attendeeId'
       , createdBy'
       , note'
       , created'
       , deleted'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "attendee_private_note")
