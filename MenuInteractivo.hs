module MenuInteractivo
(
menuPrincipal
) where


import System.Exit
import System.Console.ANSI

main = menuPrincipal

menuPrincipal :: IO()
menuPrincipal = do
  clearScreen
  putStrLn "Hola, bienvenido al wizard de <Nombre del programa>"
  putStrLn "Menu principal:"
  putStrLn "1: Comenzar"

  putStrLn "\ni: Información"
  putStrLn "q: Salir"

  putStr "Seleccione opción (pulse enter): "
  option <- getLine
  case option of
    "1" -> menu1
    "i" -> menuInformacion
    "q" -> exitSuccess
    _ -> menuError


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
  putStr "Escriba la ruta completa al archivo zip descomprimido:"
  option <- getLine
  case option of
    "q" -> menuPrincipal
    _ -> do
      let ruta = option
      menu2 ruta

menu2 :: String -> IO()
menu2 ruta = do
  clearScreen
  putStrLn "Paso 1.2 - Seleccionar el archivo a utilizar:"
  putStrLn "q: Volver"
  putStr "Escriba el nombre del archivo a utilizar: "

  option <- getLine
  case option of
    "q" -> menu1
    _ -> do
      let archivo = ruta ++ "/" ++ option
      menu3 archivo

menu3 :: String -> IO()
menu3 archivo = do
  clearScreen
  putStrLn "Paso 1.3 - Comprobación:"
  putStrLn "q: Volver, Intro OK"
  putStr "Asegurese de que la ruta es correcta: "
  print archivo

  option <- getLine
  case option of
    "q" -> menu1
    _ -> exitSuccess
