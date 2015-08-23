{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
------------------------------------------------------------------------------
module OpenArms.Util where
------------------------------------------------------------------------------
import           Data.Text (Text)
import           Language.Haskell.TH
import qualified Data.Text as T
import           Data.Time
import           Data.Text (Text)
import           Data.Time (Day, LocalTime)
import           Database.HDBC.Query.TH (defineTableFromDB)
import           Database.HDBC.Schema.Driver (typeMap)
import           Database.HDBC.Schema.PostgreSQL (driverPostgreSQL)
import           Database.Record.TH (derivingShow)
import           Language.Haskell.TH (Q, Dec, TypeQ)
import           Language.Haskell.TH.Name.CamelCase (ConName)
import           Database.HDBC.PostgreSQL
------------------------------------------------------------------------------
convTypes :: [(String, TypeQ)]
convTypes = [ ("varchar", [t|Text|] )
            , ("timestamp", [t|UTCTime|] )
            , ("date", [t|UTCTime|] )
            ]
------------------------------------------------------------------------------
defineTable :: String -> Q [Dec]
defineTable tableName =
  defineTableFromDB
   (connectPostgreSQL connString)
   driverPostgreSQL { typeMap = convTypes  }
   "OpenArms"
   tableName
   [derivingShow]  
------------------------------------------------------------------------------ 
connString :: String
connString = "host=localhost user=dmj dbname=openarms"
