{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module TiposDatos
(
Account,
defaultAccount,
--Accesor methods
phoneNumber,  email, createdVia,  username,  accountId ,  createdAt,  accountDisplayName,

Description,
bio,website,location,

Profile,
defaultProfile,
description,avatarMediaUrl,

Verified,
defaultVerified,
--Accesor methods
verified,

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


data Description = Description {
  bio :: String,
  website :: String,
  location :: String
} deriving (Generic, Show)
instance FromJSON Description
defaultDescription = Description {bio="", website="", location=""}

data Profile = Profile {
  description :: Description,
  avatarMediaUrl :: String
} deriving (Generic, Show)
instance FromJSON Profile
defaultProfile = Profile  {description=defaultDescription, avatarMediaUrl=""}


data Verified = Verified {
  verified :: Bool
} deriving (Generic, Show)
instance FromJSON Verified
defaultVerified = Verified {verified=False}



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
