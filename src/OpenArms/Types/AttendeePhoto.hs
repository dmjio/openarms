{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.AttendeePhoto
       ( -- * Types
         AttendeePhoto (..)
       , columnOffsetsAttendeePhoto
       , tableOfAttendeePhoto
       , attendeePhoto
       , insertAttendeePhoto
       , insertQueryAttendeePhoto
       , selectAttendeePhoto
       , updateAttendeePhoto
       , fromSqlOfAttendeePhoto
       , toSqlOfAttendeePhoto
       , id'
       , attendeeId'
       , created'
       , fileName'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "attendee_photo")
