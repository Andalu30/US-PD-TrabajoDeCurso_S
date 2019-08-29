{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

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
verified,

Phone,
defaultPhone,
phoneNumber2, --accesor

Tweets,
Tweet,
--defaultTweets,
defaultTweet,
favorite_count,
retweet_count,
created_at,
full_text,
lang,

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


data Phone = Phone {
  phoneNumber2 :: String
} deriving (Generic, Show)
instance FromJSON Phone
defaultPhone = Phone {phoneNumber2 = "555"}




----------------------------Tweets
data Tweet = Tweet {
  favorite_count :: String,
  retweet_count :: String,
  created_at :: String,
  full_text :: String,
  lang :: String
} deriving (Generic, Show)
instance FromJSON Tweet
defaultTweet = Tweet {full_text="",  created_at="", lang="", retweet_count="", favorite_count=""}


data Tweets = Tweets {
  tweets :: [Tweet]
} deriving (Generic, Show)
instance FromJSON Tweets
--defaultTweets = Tweets {}
