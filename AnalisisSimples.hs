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




verInformacionVerified :: String -> IO()
verInformacionVerified path = do
  clearScreen
  let verifiedObj = ParsersArchivos.parseVerified path
  verifiedObj <- verifiedObj
  putStrLn "Esta es la informacion de verificación de su cuenta:\nInformacion basica:"
  putStrLn $ "\t¿Esta su cuenta verificada?: "++ if verified verifiedObj then "Sí, ehnorabuena" else "No"







verInformacionProfile path = exitSuccess




verInformacionPhone :: String -> IO()
verInformacionPhone path = do
  clearScreen
  let phoneObj = ParsersArchivos.parsePhone path
  phoneObj <- phoneObj
  putStrLn $ "Este es el número de teléfono asociado a su cuenta: "++ phoneNumber2 phoneObj







abrirNavegador :: String -> String -> IO()
abrirNavegador ruta archivo
  | archivo == "account.js" = abrirNavegadorAccount (ruta ++"/"++ archivo)


abrirNavegadorAccount :: String -> IO()
abrirNavegadorAccount path = do
  putStrLn "Abriendo cuenta en el navegador"
  -- runCommand "firefox andalu30.me"
