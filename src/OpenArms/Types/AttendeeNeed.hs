{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.AttendeeNeed
       ( -- * Types
         AttendeeNeed (..)
       , columnOffsetsAttendeeNeed
       , tableOfAttendeeNeed
       , attendeeNeed
       , insertAttendeeNeed
       , insertQueryAttendeeNeed
       , selectAttendeeNeed
       , updateAttendeeNeed
       , fromSqlOfAttendeeNeed
       , toSqlOfAttendeeNeed
       , attendeeId'
       , needId'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "attendee_need")
