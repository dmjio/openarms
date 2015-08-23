{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Item
       ( -- * Types
         Item (..)
       , columnOffsetsItem
       , tableOfItem
       , item
       , insertItem
       , insertQueryItem
       , selectItem
       , updateItem
       , fromSqlOfItem
       , toSqlOfItem
       , id'
       , name'
       , special'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "item")
