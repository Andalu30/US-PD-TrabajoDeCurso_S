{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}


module ParsersArchivos
(
parseAccount,
parseProfile,
parseVerified
) where


import TiposDatos
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
