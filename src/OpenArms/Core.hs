{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
------------------------------------------------------------------------------
-- |
-- Module      : OpenArms.Core
-- Copyright   : (c) Open Arms, Inc.
-- Maintainer  : djohnson.m@gmail.com
-- Stability   : experimental
-- Portability : POSIX
-- 
------------------------------------------------------------------------------
module OpenArms.Core ( OpenArms(..), runApp ) where
------------------------------------------------------------------------------
import Control.Monad.Except        ( MonadError  )
import Control.Monad.Trans.Control ( MonadBaseControl (..), StM )
import Control.Monad.IO.Class      ( MonadIO     )
import Control.Monad.Base          ( MonadBase   )
import Control.Monad.Reader        ( MonadReader, ReaderT, runReaderT   )
import Control.Monad.Trans.Either  ( EitherT, runEitherT )
import Data.Text                   ( Text        )
import Servant
import Network.Wai                 ( Application )
------------------------------------------------------------------------------
import OpenArms.Config              ( AppConfig(..)  )
------------------------------------------------------------------------------
-- | Core OpenArms Type
newtype OpenArms a = OpenArms {
    runOpenArms ::  ReaderT AppConfig (EitherT String IO) a
  } deriving ( MonadIO, MonadBase IO, MonadReader AppConfig
             , Applicative, Monad, Functor, MonadError String )
------------------------------------------------------------------------------
-- | Associated type for maintaining base context while forking
-- threads
newtype StMOpenArms a = StMOpenArms {
    runStMOpenArms :: StM (ReaderT AppConfig (EitherT String IO)) a
  }
------------------------------------------------------------------------------
-- | This allows us to fork a new thread while maintaining base context
instance MonadBaseControl IO OpenArms where
  type StM OpenArms a = StMOpenArms a
  liftBaseWith f = OpenArms
                 $ liftBaseWith
                 $ \g' -> f
                 $ \m -> fmap StMOpenArms
                 $ g' $ runOpenArms m
  restoreM = OpenArms . restoreM . runStMOpenArms
------------------------------------------------------------------------------
-- | runApp - helper for transformer stack evaluation
runApp :: AppConfig -> OpenArms a -> IO (Either String a)
runApp config = runEitherT . flip runReaderT config . runOpenArms

