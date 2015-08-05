{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}
------------------------------------------------------------------------------
module OpenArms.Web.User where
------------------------------------------------------------------------------
import Servant
import Servant.Server
------------------------------------------------------------------------------
import OpenArms.Core
import OpenArms.Types.User
import OpenArms.Types.Common
------------------------------------------------------------------------------
type UserAPI = "user" :> "register" :> ReqBody '[JSON] Register :> Post '[JSON] User
          :<|> "user" :> "login"    :> ReqBody '[JSON] Login    :> Post '[JSON] User 
------------------------------------------------------------------------------
-- | User API
userAPI :: ServerT UserAPI OpenArms 
userAPI = register :<|> login 
------------------------------------------------------------------------------
-- | Register API
register :: Register -> OpenArms User
register = undefined
  -- 1. Validate email  
  -- 2. Does the user already exist?
  -- 3. Insert into pg
  -- 3. Set sessionID in session
  -- 4. Get the CSRF Token, return with new user payload

------------------------------------------------------------------------------
-- | Login API
login :: Login -> OpenArms User
login = undefined
