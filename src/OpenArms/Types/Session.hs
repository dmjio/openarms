{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Session
       ( -- * Types
         Session (..)
       , columnOffsetsSession
       , tableOfSession
       , session
       , insertSession
       , insertQuerySession
       , selectSession
       , updateSession
       , fromSqlOfSession
       , toSqlOfSession
       , id'
       , sessionDay'
       , mealsServed'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "session")
