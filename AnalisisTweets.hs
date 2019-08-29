{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module AnalisisTweets
(
Tweets,
) where


import System.Exit
import System.Process
import ParsersArchivos
import TiposDatos
import System.Console.ANSI
import GHC.Generics
import Data.Aeson
import Data.Aeson.Types
import qualified Data.ByteString.Lazy as B
