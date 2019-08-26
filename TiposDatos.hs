{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module TiposDatos
(
Account,
defaultAccount,
--Accesor
phoneNumber,  email, createdVia,  username,  accountId ,  createdAt,  accountDisplayName,
printTelefono


) where

import GHC.Generics
import Data.Aeson
import qualified Data.ByteString.Lazy as B

data Account = Account {
  phoneNumber :: String,
  email :: String,
  createdVia :: String,
  username :: String,
  accountId :: String,
  createdAt :: String,
  accountDisplayName :: String
} deriving (Generic, Show)
instance FromJSON Account
defaultAccount = Account {  phoneNumber = "",  email = "", createdVia ="",  username ="",  accountId ="",  createdAt ="",  accountDisplayName =""}


printTelefono account = print (phoneNumber account)
