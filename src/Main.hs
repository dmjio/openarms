{-# LANGUAGE OverloadedStrings #-}
------------------------------------------------------------------------------
module Main where
------------------------------------------------------------------------------
import Control.Monad.IO.Class 
import Network.Wai.Handler.Warp
import Network.Wai.Middleware.RequestLogger
------------------------------------------------------------------------------
import OpenArms.Config
import OpenArms.App
------------------------------------------------------------------------------
-- | Main application
main :: IO ()
main = do
  config@AppConfig{ port = port } <- getConfig 
  putStrLn $ "Running on port " ++ show port ++ "..."
  run port $ logStdout (app config)
