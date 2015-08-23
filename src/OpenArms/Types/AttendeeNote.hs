{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.AttendeeNote 
       ( -- * Types
         AttendeeNote (..)
       , columnOffsetsAttendeeNote
       , tableOfAttendeeNote
       , attendeeNote
       , insertAttendeeNote
       , insertQueryAttendeeNote
       , selectAttendeeNote
       , updateAttendeeNote
       , fromSqlOfAttendeeNote
       , toSqlOfAttendeeNote
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
$(defineTable "attendee_note")
