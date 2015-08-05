{-# LANGUAGE OverloadedStrings #-}
module OpenArms.Config where
------------------------------------------------------------------------------
import Data.Monoid
import Data.Configurator
import Database.PostgreSQL.Simple
import qualified Data.ByteString as B
import Data.ByteString (ByteString)
------------------------------------------------------------------------------
data AppConfig = AppConfig {
    pgConn :: Connection
  , port   :: Integer
  , key    :: ByteString
  } 
------------------------------------------------------------------------------
getAppConfig :: IO AppConfig
getAppConfig = do
  config <- load ["openarms.cfg"]
  info <- ConnectInfo
           <$> lookupDefault "localhost" config "pg.host"
           <*> lookupDefault 5432 config "pg.port"
           <*> lookupDefault "postgres" config "pg.user"
           <*> lookupDefault mempty config "pg.password"
           <*> lookupDefault "openarms" config "pg.database"
  AppConfig
     <$> connect info
     <*> lookupDefault 8000 config "env.port"
     <*> pure "foo"
    