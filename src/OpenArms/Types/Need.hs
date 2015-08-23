{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Need
       ( -- * Types
         Need (..)
       , columnOffsetsNeed
       , tableOfNeed
       , need
       , insertNeed
       , insertQueryNeed
       , selectNeed
       , updateNeed
       , fromSqlOfNeed
       , toSqlOfNeed
       , id'
       , name'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "need")
