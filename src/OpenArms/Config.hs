{-# LANGUAGE OverloadedStrings #-}
------------------------------------------------------------------------------
module OpenArms.Config where
------------------------------------------------------------------------------
import           Data.Monoid
import           Data.Configurator
import           Database.PostgreSQL.Simple
import qualified Data.ByteString as B
import           Data.ByteString (ByteString)
import           Web.ClientSession
------------------------------------------------------------------------------
data AppConfig = AppConfig {
    pgConn :: Connection
  , port   :: Int
  , key    :: Key
  } 
------------------------------------------------------------------------------
getConfig :: IO AppConfig
getConfig = do
  config <- load ["openarms.cfg"]
  info <- ConnectInfo
           <$> lookupDefault "localhost" config "pg.host"
           <*> lookupDefault 5432 config "pg.port"
           <*> lookupDefault "dmj" config "pg.user"
           <*> lookupDefault mempty config "pg.password"
           <*> lookupDefault "openarms" config "pg.database"
  print info
  AppConfig
     <$> connect info
     <*> lookupDefault 8000 config "env.port"
     <*> getDefaultKey
    
