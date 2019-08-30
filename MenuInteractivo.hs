module MenuInteractivo
(
menuPrincipal
) where


import System.Exit
import System.Console.ANSI
import AnalisisSimples
import AnalisisTweets

main = menuPrincipal

menuPrincipal :: IO()
menuPrincipal = do
  clearScreen
  putStrLn "Hola, bienvenido al wizard de <Nombre del programa>"
  putStrLn "Menu principal:"
  putStrLn "Pulse enter para comenzar o escriba alguna opción"

  putStrLn "\ni: Información"
  putStrLn "q: Salir"

  option <- getLine
  case option of
    "i" -> menuInformacion
    "q" -> exitSuccess
    _ -> menu1



menuError :: IO()
menuError = do
  putStr "Lo sentimos se ha producido un error"
  exitSuccess

--TODO
menuInformacion :: IO()
menuInformacion = menuError


menu1 :: IO()
menu1 = do
  clearScreen
  putStrLn "Paso 1.1 - Preparar datos:"
  putStrLn "\nq: Salir"
  putStr "Escriba la ruta completa a la carpeta del archivo zip descomprimido (Sin la barra final): "
  option <- getLine
  case option of
    "q" -> menuPrincipal
    _ -> do
      let ruta = option
      menu2 ruta

menu2 :: String -> IO()
menu2 ruta = do
  clearScreen
  putStrLn "Paso 1.2 - Seleccionar el archivo a utilizar"
  putStrLn "q: Volver"
  putStr "Escriba el nombre del archivo a utilizar:  "

  option <- getLine
  case option of
    "q" -> menu1
    _ -> do
      let archivo = option
      print ruta
      menu3 ruta archivo

menu3 :: String -> String -> IO()
menu3 ruta archivo = do
  clearScreen
  putStrLn "Paso 1.3 - Comprobación:"
  putStrLn "q: Volver, Intro OK"
  putStr "Asegurese de que la ruta introducida es correcta: "
  let rutacompleta = ruta ++ "/" ++ archivo
  print rutacompleta

  option <- getLine
  case option of
    "q" -> menu1
    _ -> menutipoAnalisis ruta archivo


menutipoAnalisis :: String -> String -> IO()
menutipoAnalisis ruta archivo = do
  clearScreen
  putStrLn "Paso 2 - Tipo de análisis:"
  putStrLn "q: Volver, Intro OK"
  putStr "Para el archivo seleccionado existen los siguientes tipos de análisis:\n"
  let tipos = tipoAnalisis archivo
  putStr $ unlines tipos
  putStr "Por favor seleccione el tipo de análisis que desea realizar:\n"
  option <- getLine
  case option of
    {-
      1: Ver informacion
      2: Abrir en navegador
    -}
    "1" -> AnalisisSimples.verInformacion ruta archivo
    "2" -> AnalisisSimples.abrirNavegador ruta archivo

    "3" -> AnalisisTweets.verTweets (ruta++"/"++archivo)
    "4" -> AnalisisTweets.verRetweets (ruta++"/"++archivo)
    "5" -> AnalisisTweets.tweetMasRT (ruta++"/"++archivo)
    "6" -> AnalisisTweets.tweetMasMG (ruta++"/"++archivo)
    "7" -> AnalisisTweets.idiomas (ruta++"/"++archivo)

tipoAnalisis :: String -> [String]
{-
  1: Ver informacion
  2: Abrir en navegador
-}
tipoAnalisis "account.js" = ["1: Ver informacion", "2: Abrir en navegador"]
tipoAnalisis "profile.js" = ["1: Ver informacion"]
tipoAnalisis "verified.js" = ["1: Ver informacion"]
tipoAnalisis "phone-number.js" = ["1: Ver informacion"]
tipoAnalisis "tweet.js" = ["3: Ver tweets", "4: Ver Retweets", "5: Tweet mas retweeteado","6: Tweet con más MG","7: Idiomas mas utilizados"]
