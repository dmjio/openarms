{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
------------------------------------------------------------------------------
module OpenArms.Types.Common where
------------------------------------------------------------------------------
import           Control.Applicative
import           Data.Aeson
import           Data.Time
import           Data.Text    (Text)
import           Database.PostgreSQL.Simple
import           Database.PostgreSQL.Simple.FromField
import           Database.PostgreSQL.Simple.ToField
import           GHC.Generics
------------------------------------------------------------------------------
-- | Id for things
newtype Id = Id Integer deriving (Show, Eq, Num, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | JSON Id
instance ToJSON Id
instance FromJSON Id
------------------------------------------------------------------------------
-- | Email
newtype Email = Email Text deriving (Show, Eq, FromField, ToField, Generic, FromJSON)
------------------------------------------------------------------------------
-- | Password
newtype Password = Password Text deriving (Show, Eq, FromField, ToField, Generic, FromJSON)
------------------------------------------------------------------------------
-- | FirstName
newtype FirstName = FirstName Text deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | LastName
newtype LastName = LastName Text deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | MiddleInitial
newtype MI = MI Text deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | DOB
newtype DOB = DOB UTCTime deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | Created
newtype Created = Created UTCTime deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | LastLogin
newtype LastLogin = LastLogin UTCTime deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | Login Count
newtype LoginCount = LoginCount UTCTime deriving (Show, Eq, FromField, ToField, Generic)
------------------------------------------------------------------------------
-- | Register 
data Register = Register {
      registerEmail    :: Email
    , registerPassword :: Password
  } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
-- | Login
instance FromJSON Register
------------------------------------------------------------------------------
-- | Login 
data Login = Login {
      loginEmail    :: Email
    , loginPassowrd :: Password
  } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
-- | Login
instance FromJSON Login
------------------------------------------------------------------------------
-- | Role
data Role = AdminRole | UserRole
   deriving (Eq, Ord, Generic)
------------------------------------------------------------------------------
-- | FromField
instance FromField Role where
  fromField = fromJSONField
------------------------------------------------------------------------------
-- | ToField
instance ToField Role where
  toField = toJSONField
------------------------------------------------------------------------------
instance ToJSON Role
instance FromJSON Role
------------------------------------------------------------------------------
-- | Shows
instance Show Role where
  show AdminRole = "admin"
  show UserRole  = "user"
