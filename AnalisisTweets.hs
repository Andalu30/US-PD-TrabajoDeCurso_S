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
import Data.List (sortBy)
import Data.Function (on)
import Data.Maybe


test = verTweets "/home/andalu30/twitter-data/tweet.js"
test2 = verRetweets "/home/andalu30/twitter-data/tweet.js"
test3 = tweetMasRT "/home/andalu30/twitter-data/tweet.js"
test4 = tweetMasMG "/home/andalu30/twitter-data/tweet.js"
test5 = idiomas "/home/andalu30/twitter-data/tweet.js"


--verTweets :: String -> IO()
verTweets path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textos = map full_text tweets
  let soloTweets = filter (\x -> not $ Data.List.isPrefixOf "RT" x) textos
  let cantidad = length soloTweets
  -- imprimeTextosTweets $ take 10 soloTweets
  imprimeTextosTweets soloTweets
  putStr "Se han publicado "
  print cantidad
  putStrLn" tweets, sin contar retweets"


imprimeTextosTweets :: [String] -> IO()
imprimeTextosTweets [] = putStrLn "" --Base
imprimeTextosTweets (x:ls) = do  --Recursiva
  putStr "\n->"
  print x
  imprimeTextosTweets ls



verRetweets path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textos = map full_text tweets
  let soloRetweets = filter (\x -> Data.List.isPrefixOf "RT" x) textos
  let cantidad = length soloRetweets
  -- imprimeTextosTweets $ take 10 soloRetweets
  imprimeTextosTweets soloRetweets
  putStr "Se han publicado "
  print cantidad
  putStrLn" retweets"






ordenaTuplasSND = sortBy (flip compare `on` snd)


tweetMasRT path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textoyRts = map (\x -> (full_text x, retweet_count x)) tweets
  let soloMios = filter (\x -> not $ Data.List.isPrefixOf "RT" (fst x)) textoyRts --Aunque no hace falta
  let ordered = ordenaTuplasSND soloMios
  let tweetMasRT = ordered !! 0

  putStr "El tweet con mas retweets es: \n->"
  print $ fst tweetMasRT
  putStr" con "
  print $ snd tweetMasRT
  putStrLn" RTs"



tweetMasMG path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets
  let textoyMGS = map (\x -> (full_text x, favorite_count x)) tweets
  let soloMios = filter (\x -> not $ Data.List.isPrefixOf "RT" (fst x)) textoyMGS
  let ordered = ordenaTuplasSND soloMios
  let tweetMasRT = ordered !! 0

  putStr "El tweet con mas 'me gusta' es: \n->"
  print $ fst tweetMasRT
  putStr" con "
  print $ snd tweetMasRT
  putStrLn" 'me gusta'"



idiomas path = do
  clearScreen
  let tweets = ParsersArchivos.parseTweets path
  tweets <- tweets

  let textsAndLangs = map (\x -> (full_text x, lang x)) tweets
  let soloMios = filter (\x -> not $ Data.List.isPrefixOf "RT" (fst x)) textsAndLangs
  let ordered = ordenaTuplasSND soloMios
  let langs = map (\x -> snd x) ordered
  let groups = group langs

  let ids = nub langs
  let recuento = cuentaIdiomas groups []

  let index =  fromMaybe 0 (elemIndex (maximum recuento) recuento)
  let maxLang = ids !! index
  putStr "El idioma mas utilizado en los tweets es:\n\t"
  print maxLang

cuentaIdiomas [] ac = ac
cuentaIdiomas (x:xs) ac = do
  let newac = ac ++ [(length x)]
  cuentaIdiomas xs newac




  -- let idioma =
  --
  -- putStr "El idioma que mas se ha utilizado es: \n->"
  -- print $ fst tweetMasRT
  --
