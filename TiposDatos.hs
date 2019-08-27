{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}

module TiposDatos
(
Account,
defaultAccount,
--Accesor methods
phoneNumber,  email, createdVia,  username,  accountId ,  createdAt,  accountDisplayName,

Profile,
defaultProfile,

Verified,
defaultVerified,
--Accesor methods
verified

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


data Profile = Profile {
  description :: String,
  bio :: String,
  website :: String,
  location :: String,
  avatarMediaUrl :: String
} deriving (Generic, Show)
instance FromJSON Profile
defaultProfile = Profile  { description="",bio="",website="",location="",avatarMediaUrl=""}


data Verified = Verified {
  verified :: Bool
} deriving (Generic, Show)
instance FromJSON Verified
defaultVerified = Verified {verified=False}
