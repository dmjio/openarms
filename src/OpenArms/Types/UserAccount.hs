{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards       #-}
{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE StandaloneDeriving    #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
------------------------------------------------------------------------------
module OpenArms.Types.UserAccount
       ( -- * Types
         UserAccount (..)
       , columnOffsetsUserAccount
       , tableOfUserAccount
       , userAccount
       , insertUserAccount
       , insertQueryUserAccount
       , selectUserAccount
       , updateUserAccount
       , fromSqlOfUserAccount
       , toSqlOfUserAccount
       , email'
       , password'
       , userRole'
       , created'
       , lastLogin'
       , loginCount'
       , active'
       , deleted'
       ) where
------------------------------------------------------------------------------
import OpenArms.Util
import GHC.Generics
import Data.Aeson
------------------------------------------------------------------------------
$(defineTable "user_account")
------------------------------------------------------------------------------
instance ToJSON UserAccount where
  toJSON UserAccount {..} =
    object [
      "email"       .= email
    , "role"        .= userRole
    , "created"     .= created
    , "last_login"  .= lastLogin
    , "login_count" .= loginCount
    , "active"      .= active
    ]

