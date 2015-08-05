module OpenArms.Types.Attendee where
------------------------------------------------------------------------------
import Data.Aeson
import OpenArms.Types.Common
------------------------------------------------------------------------------
data Attendee = Attendee {
    id        :: Id
  , email     :: Maybe Email
  , firstName :: FirstName
  , lastName  :: LastName
  , middle    :: Maybe MI
  , dob       :: DOB
  } deriving (Show, Eq)

instance ToJSON Attendee where
   toJSON = undefined
