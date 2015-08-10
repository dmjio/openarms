{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
------------------------------------------------------------------------------
module OpenArms.Types.Common where
------------------------------------------------------------------------------
import           Control.Applicative
import           Data.List.Split
import           Data.Time
import           Data.Aeson
import           Data.Aeson.Types
import qualified Data.Text as T
import           Data.Text    (Text)
import           Data.Time
import           Data.Text    (Text)
import           Database.PostgreSQL.Simple
import           Database.PostgreSQL.Simple.FromField
import           Database.PostgreSQL.Simple.ToField
import           GHC.Generics
------------------------------------------------------------------------------
-- | Id for things
newtype Id = Id Integer
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Age for things
newtype Age = Age Integer
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Email
newtype Email = Email Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Password
newtype Password = Password Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | FirstName
newtype FirstName = FirstName Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Nickname
newtype NickName = NickName Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | LastName
newtype LastName = LastName Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Name
newtype Name = Name Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | MiddleInitial
newtype MI = MI Text
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | DOB
newtype DOB = DOB Day
  deriving (Show, Eq, FromField, ToField, Generic, ToJSON,FromJSON)
------------------------------------------------------------------------------
instance FromJSON Day where
  parseJSON k@(String x) =
    case splitOn "-" (T.unpack x) of
      [yyyy,mm,dd] -> return $ fromGregorian (read yyyy) (read mm) (read dd)
      otherwise -> typeMismatch "Day" k
------------------------------------------------------------------------------
instance ToJSON Day where
  toJSON d = String $ T.pack (showGregorian d)
------------------------------------------------------------------------------
-- | Deceased
newtype Deceased = Deceased Day
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Created
newtype Created = Created UTCTime
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Deleted
newtype Deleted = Deleted Bool
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | LastLogin
newtype LastLogin = LastLogin UTCTime
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
------------------------------------------------------------------------------
-- | Login Count
newtype LoginCount = LoginCount UTCTime
  deriving (Show, Eq, FromField, ToField, Generic, FromJSON, ToJSON)
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
      email    :: Email
    , password :: Password
  } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
-- | Login
instance FromJSON Login
instance ToJSON Login
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
