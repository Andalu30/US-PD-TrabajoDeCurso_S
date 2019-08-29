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
import Data.List
import qualified Data.ByteString.Lazy as B



test = verTweets "/home/andalu30/twitter-data/tweet.js"
test2 = verRetweets "/home/andalu30/twitter-data/tweet.js"

--verTweets :: String -> IO()
verTweets path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textos = map full_text tweets
  let soloTweets = filter (\x -> not $ Data.List.isPrefixOf "RT" x) textos
  let cantidad = length soloTweets
  imprimeTextosTweets $ take 10 soloTweets
  putStr "Se han publicado "
  print cantidad
  putStrLn" tweets, sin contar retweets"


imprimeTextosTweets :: [String] -> IO()
imprimeTextosTweets [] = putStrLn "" --Base
imprimeTextosTweets (x:ls) = do  --Recursiva
  putStr "\t -"
  putStrLn x
  imprimeTextosTweets ls



verRetweets path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textos = map full_text tweets
  let soloRetweets = filter (\x -> Data.List.isPrefixOf "RT" x) textos
  let cantidad = length soloRetweets
  imprimeTextosTweets $ take 10 soloRetweets
  putStr "Se han publicado "
  print cantidad
  putStrLn" retweets"




tweetMasRT path = exitSuccess
tweetMasMG path = exitSuccess
idiomas path = exitSuccess
