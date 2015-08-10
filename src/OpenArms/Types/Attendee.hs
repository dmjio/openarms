{-# LANGUAGE DeriveGeneric #-}
------------------------------------------------------------------------------
module OpenArms.Types.Attendee where
------------------------------------------------------------------------------
import Data.Aeson
import Data.Text    (Text)
import OpenArms.Types.Common
import GHC.Generics
import Database.PostgreSQL.Simple.FromRow
import Database.PostgreSQL.Simple
------------------------------------------------------------------------------
import OpenArms.Config
------------------------------------------------------------------------------
data Attendee = Attendee {
    id        :: Id
  , email     :: Maybe Email
  , firstName :: Maybe FirstName
  , middle    :: Maybe MI
  , lastName  :: Maybe LastName
  , nickName  :: Maybe NickName
  , age       :: Maybe Age
  , lang      :: Integer
  , mail      :: Bool
  , deceased  :: Maybe Deceased
  , dob       :: Maybe DOB
  , created   :: Created
  , deleted   :: Deleted
  } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
instance ToJSON Attendee
instance FromJSON Attendee
------------------------------------------------------------------------------
instance FromRow Attendee where
  fromRow = Attendee <$> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
                     <*> field
------------------------------------------------------------------------------
-- | Get Attendees
--xs :: [(Only (Id 1))] <- query_ pgg "select id from attendees"

