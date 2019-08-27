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
  account <- account

  putStrLn "Esta es la informacion de la cuenta:\nInformacion basica:"
  putStrLn $ "\tNombre: "++ accountDisplayName account
  putStrLn $ "\tUsuario: "++ username account
  putStrLn $ "\tEmail: "++ email account
  putStrLn $ "\tTelefono: "++ phoneNumber account

  putStrLn $ "Datos adicionales:\n\tIdentificador de la cuenta: "++ accountId account
  putStrLn $ "\tFecha de la creación de la cuenta: "++ createdAt account
  putStrLn $ "\tMétodo de creación de la cuenta: "++ createdVia account


verInformacionProfile :: String -> IO()
verInformacionProfile path = do
  clearScreen
  let profile = ParsersArchivos.parseAccount path
  account <- account





verInformacionVerified path = exitSuccess
verInformacionPhone path = exitSuccess








abrirNavegador :: String -> String -> IO()
abrirNavegador ruta archivo
  | archivo == "account.js" = abrirNavegadorAccount (ruta ++"/"++ archivo)


abrirNavegadorAccount :: String -> IO()
abrirNavegadorAccount path = do
  putStrLn "Abriendo cuenta en el navegador"
  -- runCommand "firefox andalu30.me"
