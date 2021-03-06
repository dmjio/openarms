{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Status 
       ( -- * Types
         Status (..)
       , columnOffsetsStatus
       , tableOfStatus
       , status
       , insertStatus
       , insertQueryStatus
       , selectStatus
       , updateStatus
       , fromSqlOfStatus
       , toSqlOfStatus
       , id'
       , name'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "status")
