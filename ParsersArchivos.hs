{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}


module ParsersArchivos
(
parseAccount,
parseProfile,
parseVerified,
parsePhone
) where


import TiposDatos
import System.Exit
import Data.Aeson
import qualified Data.ByteString.Lazy as B



parseAccount path = do
  preparaAccount path
  file <- B.readFile (path++".mod")
  let account = decode file :: Maybe TiposDatos.Account
  case account of
    Nothing -> return TiposDatos.defaultAccount
    Just account -> return account

preparaAccount :: String -> IO()
preparaAccount path = do
  file <- readFile path --String
  let mod = modAccFile file
  writeFile (path++".mod") mod
  return()
modAccFile :: String -> String
modAccFile string = drop 45 $ reverse $ drop 3 $ reverse string



--parseProfile
parseProfile path = do
  preparaProfile path
  file <- B.readFile (path++".mod")
  let profile = decode file :: Maybe TiposDatos.Profile
  case profile of
    Nothing -> return TiposDatos.defaultProfile
    Just profile -> return profile

preparaProfile :: String -> IO()
preparaProfile path = do
  file <- readFile path --String
  let mod = modProFile file
  writeFile (path++".mod") mod
  return()
modProFile :: String -> String
modProFile string = drop 45 $ reverse $ drop 3 $ reverse string




--parseVerified
parseVerified path = do
  preparaVerified path
  file <- B.readFile (path++".mod")
  let verified = decode file :: Maybe TiposDatos.Verified
  case verified of
    Nothing -> return TiposDatos.defaultVerified
    Just verified -> return verified

preparaVerified:: String -> IO()
preparaVerified path = do
  file <- readFile path --String
  let mod = modVeriFile file
  writeFile (path++".mod") mod
  return()
modVeriFile :: String -> String
modVeriFile string ="{" ++ (drop 79 $ reverse $ drop 4 $ reverse string)



--parsePhone
parsePhone path = do
  preparaPhone path
  file <- B.readFile (path++".mod")
  let phone = decode file :: Maybe TiposDatos.Phone
  case phone of
    Nothing -> return TiposDatos.defaultPhone
    Just phone -> return phone

preparaPhone:: String -> IO()
preparaPhone path = do
  file <- readFile path --String
  let mod = modPhoneFile file
  writeFile (path++".mod") mod
  return()
modPhoneFile :: String -> String
modPhoneFile string ="{" ++ (drop 50 $ reverse $ drop 4 $ reverse string)






testing = do
  let tweets = parseTweets "/home/andalu30/twitter-data/tweet.js"
  tweets <- tweets
  putStrLn $ show $ take 10 tweets

--parseTweets :: String -> [Tweet]
parseTweets path = do
  preparaTweets path
  file <- B.readFile (path++".mod")
  let tweets = decode file :: Maybe [Tweet]
  case tweets of
    Nothing -> exitSuccess
    Just tweets -> return tweets

preparaTweets:: String -> IO()
preparaTweets path = do
  file <- readFile path --String
  let mod = modTweetsFile file
  writeFile (path++".mod") mod
  return()
modTweetsFile :: String -> String
modTweetsFile string = drop 25 string
