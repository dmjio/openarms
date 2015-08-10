{-# LANGUAGE DeriveGeneric #-}
------------------------------------------------------------------------------
module OpenArms.Types.Language where
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
data Language = Language
   { id   :: Id
   , name :: Name
   } deriving (Show, Eq, Generic)
------------------------------------------------------------------------------
instance ToJSON Language
instance FromJSON Language
------------------------------------------------------------------------------
instance FromRow Language where
  fromRow = Language <$> field
                     <*> field
