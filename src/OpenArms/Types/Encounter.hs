{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Encounter
       ( -- * Types
         Encounter (..)
       , columnOffsetsEncounter
       , tableOfEncounter
       , encounter
       , insertEncounter
       , insertQueryEncounter
       , selectEncounter
       , updateEncounter
       , fromSqlOfEncounter
       , toSqlOfEncounter
       , id'
       , attendeeId'
       , sessionId'
       , created'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "encounter")
