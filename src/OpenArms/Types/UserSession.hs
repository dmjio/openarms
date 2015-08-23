{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.UserSession 
       ( -- * Types
         UserSession (..)
       , columnOffsetsUserSession
       , tableOfUserSession
       , userSession
       , insertUserSession
       , insertQueryUserSession
       , selectUserSession
       , updateUserSession
       , fromSqlOfUserSession
       , toSqlOfUserSession
       , id'
       , userId'
       , created'
       , expiration'
       , active'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "user_session")
