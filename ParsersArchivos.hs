{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}


module ParsersArchivos
(
parseAccount
) where


import TiposDatos
import Data.Aeson
import qualified Data.ByteString.Lazy as B



--parseAccount :: String -> Account
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
