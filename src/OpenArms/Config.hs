{-# LANGUAGE OverloadedStrings #-}
------------------------------------------------------------------------------
module OpenArms.Config where
------------------------------------------------------------------------------
import           Data.Monoid
import           Data.Configurator
import qualified Data.ByteString as B
import           Data.ByteString (ByteString)
import           Web.ClientSession
import           Database.HDBC.PostgreSQL
------------------------------------------------------------------------------
import           OpenArms.Util
------------------------------------------------------------------------------
data AppConfig = AppConfig {
    pgConn :: Connection
  , port   :: Int
  , key    :: Key
  } 
------------------------------------------------------------------------------
getConfig :: IO AppConfig
getConfig = do
  config  <- load ["openarms.cfg"]
  conn <- connectPostgreSQL connString
  AppConfig
     <$> pure conn
     <*> lookupDefault 8000 config "env.port"
     <*> getDefaultKey
    
