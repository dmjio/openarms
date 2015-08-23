{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.Role
       ( -- * Types
         UserRole (..)
         -- * Ops
       , columnOffsetsUserRole
       , tableOfUserRole
       , userRole
       , insertUserRole
       , insertQueryUserRole
       , roleName'
       , updateUserRole
       , selectUserRole
       , fromSqlOfUserRole
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
------------------------------------------------------------------------------
$(defineTable "user_role")
