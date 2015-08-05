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
  config@AppConfig{ port = port } <- getAppConfig 
  let port = 8080
  putStrLn $ "Running on port " ++ show port ++ "..."
  run 8080 $ logStdout (app config)
