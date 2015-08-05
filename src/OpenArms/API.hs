{-# LANGUAGE TypeOperators #-}
------------------------------------------------------------------------------
module OpenArms.API ( OpenArmsAPI, apiEndpoints ) where
------------------------------------------------------------------------------
import Servant
import Servant.Server
------------------------------------------------------------------------------
import OpenArms.Core
import OpenArms.Web.User
import OpenArms.Web.Attendee
------------------------------------------------------------------------------
type OpenArmsAPI =
         UserAPI
    :<|> AttendeeAPI
------------------------------------------------------------------------------
apiEndpoints :: ServerT OpenArmsAPI OpenArms
apiEndpoints = userAPI :<|> attendeeAPI
