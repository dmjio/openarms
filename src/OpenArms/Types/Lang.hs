{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Lang 
       ( -- * Types
         Lang (..)
       , columnOffsetsLang
       , tableOfLang
       , lang
       , insertLang
       , insertQueryLang
       , selectLang
       , updateLang
       , fromSqlOfLang
       , toSqlOfLang
       , id'
       , name'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "lang")
