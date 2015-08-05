module OpenArms.Types.User where
------------------------------------------------------------------------------
import Data.Aeson
import qualified Data.Text as T
import           Data.Text    (Text)
import            Database.PostgreSQL.Simple.FromRow
import            Database.PostgreSQL.Simple.FromField
import            Database.PostgreSQL.Simple.ToRow
-----------------------------------------------------------------------------
import           OpenArms.Types.Common
------------------------------------------------------------------------------
-- | User
data User = User {
    id         :: Id
  , email      :: Email
  , password   :: Password
  , role       :: Role
  , resetId    :: Text
  , dob        :: DOB
  , created    :: Created
  , lastLogin  :: LastLogin
  , loginCount :: LoginCount
  } deriving (Show, Eq)
------------------------------------------------------------------------------
-- | FromRow User
instance FromRow User where
  fromRow = User <$> field <*> field <*> field
                 <*> field <*> field <*> field
                 <*> field <*> field <*> field

instance ToJSON User where
   toJSON = undefined
