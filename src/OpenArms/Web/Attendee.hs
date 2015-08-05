{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
------------------------------------------------------------------------------
module OpenArms.Web.Attendee where
------------------------------------------------------------------------------
import OpenArms.Types.Attendee
import OpenArms.Core
------------------------------------------------------------------------------
import Servant
import Servant.Server
------------------------------------------------------------------------------
type AttendeeAPI = "attendee" :> Get '[JSON] [Attendee]
------------------------------------------------------------------------------
-- | API
attendeeAPI :: ServerT AttendeeAPI OpenArms 
attendeeAPI = undefined
