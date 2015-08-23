{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.AttendeeSession
       ( -- * Types
         AttendeeSession (..)
       , columnOffsetsAttendeeSession
       , tableOfAttendeeSession
       , attendeeSession
       , insertAttendeeSession
       , insertQueryAttendeeSession
       , selectAttendeeSession
       , updateAttendeeSession
       , fromSqlOfAttendeeSession
       , toSqlOfAttendeeSession
       , id'
       , attendeeId'
       , sessionId'
       , checkIn'
       , checkOut'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "attendee_session")
