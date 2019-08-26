module AnalisisSimples
(
verInformacion,
abrirNavegador
) where


import System.Exit
import System.Process
import ParsersArchivos
import TiposDatos
import System.Console.ANSI


verInformacion :: String -> String -> IO()
verInformacion ruta archivo
  | archivo == "account.js" = verInformacionAccount (ruta ++"/"++ archivo)
  | archivo == "profile.js" = verInformacionProfile (ruta ++"/"++ archivo)
  | archivo == "verified.js" = verInformacionVerified (ruta ++"/"++ archivo)
  | archivo == "phone-number.js" = verInformacionPhone (ruta ++"/"++ archivo)


verInformacionAccount :: String -> IO()
verInformacionAccount path = do
  clearScreen
  let account = ParsersArchivos.parseAccount path
  --putStr $ show $ TiposDatos.printTelefono account
  putStr "Hello there"


verInformacionProfile path = exitSuccess
verInformacionVerified path = exitSuccess
verInformacionPhone path = exitSuccess








abrirNavegador :: String -> String -> IO()
abrirNavegador ruta archivo
  | archivo == "account.js" = abrirNavegadorAccount (ruta ++"/"++ archivo)


abrirNavegadorAccount :: String -> IO()
abrirNavegadorAccount path = do
  putStrLn "Abriendo cuenta en el navegador"
  -- runCommand "firefox andalu30.me"
