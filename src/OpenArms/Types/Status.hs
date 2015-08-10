{-# LANGUAGE DeriveGeneric #-}
------------------------------------------------------------------------------
module OpenArms.Types.Status where
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
data Status = Status
   { id   :: Id
   , name :: Name
   } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
instance ToJSON Status
instance FromJSON Status
------------------------------------------------------------------------------
instance FromRow Status where
  fromRow = Status <$> field
                   <*> field
