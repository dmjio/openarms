{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}
------------------------------------------------------------------------------
module OpenArms.Web.User where
------------------------------------------------------------------------------
import Servant
import Servant.Server
------------------------------------------------------------------------------
import OpenArms.Core
import OpenArms.Types.UserAccount
------------------------------------------------------------------------------
type UserAPI = "user" :> "register" :> ReqBody '[JSON] Int :> Post '[JSON] UserAccount
          :<|> "user" :> "login"    :> ReqBody '[JSON] Int    :> Post '[JSON] UserAccount 
------------------------------------------------------------------------------
-- | User API
userAPI :: ServerT UserAPI OpenArms 
userAPI = register :<|> login 
------------------------------------------------------------------------------
-- | Register API
register :: a -> OpenArms UserAccount
register = undefined
  -- 1. Validate email  
  -- 2. Does the user already exist?
  -- 3. Insert into pg
  -- 3. Set sessionID in session
  -- 4. Get the CSRF Token, return with new user payload

------------------------------------------------------------------------------
-- | Login API
login :: a -> OpenArms UserAccount
login = undefined
