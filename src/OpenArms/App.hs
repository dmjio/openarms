{-# LANGUAGE TypeOperators #-}
------------------------------------------------------------------------------
module OpenArms.App where
------------------------------------------------------------------------------
import Control.Monad.Reader
import Servant
import Network.Wai
import Control.Monad.Trans.Either
------------------------------------------------------------------------------
import OpenArms.Config
import OpenArms.Core
import OpenArms.API
------------------------------------------------------------------------------
-- | Application
app :: AppConfig -> Application
app cfg = serve (Proxy :: Proxy OpenArmsAPI) server
  where
    server :: Server OpenArmsAPI
    server = enter runV handlers

    runV :: OpenArms :~> EitherT ServantErr IO
    runV = Nat $ bimapEitherT toErr id . flip runReaderT cfg . runOpenArms
    
    toErr :: String -> ServantErr
    toErr = undefined

    handlers :: ServerT OpenArmsAPI OpenArms
    handlers = apiEndpoints



