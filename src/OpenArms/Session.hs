{-# LANGUAGE OverloadedStrings #-}
------------------------------------------------------------------------------
module OpenArms.Session where
------------------------------------------------------------------------------
import           Web.Cookie
import           Data.Configurator
import           Database.PostgreSQL.Simple
import qualified Data.ByteString as B
import           Data.ByteString (ByteString)
------------------------------------------------------------------------------
-- Create a session on login / register
-- Check if a session exists



