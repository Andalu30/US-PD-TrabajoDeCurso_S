{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module TiposDatos2
(
Phone,
phoneNumber,
defaultPhone
) where

import GHC.Generics
import Data.Aeson
import qualified Data.ByteString.Lazy as B

data Phone = Phone {
  phoneNumber :: String
} deriving (Generic, Show)
instance FromJSON Phone
defaultPhone = Phone {phoneNumber = "555"}
