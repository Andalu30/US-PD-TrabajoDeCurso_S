# TweeKell - Análisis de los datos privados de una cuenta de Twitter con Haskell
Repositorio para los archivos y la documentación del trabajo de curso de la asignatura PD del grado de Ingeniería Informática - Tecnologías Informáticas.

# Índice
* [Ejecución del programa](#ejecución-del-programa)
   * [Requisitos previos](#requisitos-previos)
   * [Utilizando el archivo binario compilado](#utilizando-el-archivo-binario-compilado)
   * [Utilizando el código fuente](#utilizando-el-código-fuente)
      * [Dependencias](#dependencias)
      * [Ejecución de los archivos](#ejecución-de-los-archivos)
* [Archivos del repositorio](#archivos-del-repositorio)
* [Documentación](#documentación)
* [Información del autor](#información-del-autor)




## Ejecución del programa

### Requisitos previos
Para poder utilizar este programa son necesarios los datos de la cuenta de Twitter en formato JSON.
Para más información, visite [la pagina de soporte de Twitter](https://help.twitter.com/es/managing-your-account/accessing-your-twitter-data).

Generalmente, estando logueado en Twitter viaje a: Ajustes -> Cuenta -> Mis datos de Twitter -> Introduzca su contraseña -> Pedir datos.

**IMPORTANTE:** Dependiendo de su cuenta es posible que el proceso de recolección de datos de Twitter tarde varios minutos, por lo que se recomienda descargar estos datos previamente.

Ademas, si desea utilizar las funciones de mostrar imágenes y consultar su perfil será necesario que tenga instalado el navegador Firefox. Consulte el gestor de paquetes de su distribución para asegurarse de que lo tiene instalado.

### Utilizando el archivo binario compilado
Si se encuentra en un equipo GNU/Linux es posible utilizar el archivo compilado ```TweeKell``` para ver el resultado final del trabajo.

Abra una terminal y viaje a la carpeta que contiene el archivo con ```cd <path to folder>```, escriba ```./TweeKell``` y se deberia de ejecutar la aplicación. Asegurese de que el archivo tiene


### Utilizando el código fuente
#### Dependencias
Para ejecutar los archivos es necesario tener instalado Haskell, Aeson y ansi-terminal.
A continuación se explica como preparar el entorno en un equipo con Ubuntu 18.10.

Instalación de haskell:
```
sudo apt-get install haskell-platform
```

Actualización de Haskell e instalación de las dependencias:
```
sudo cabal update
sudo cabal install aeson
sudo cabal install ansi-terminal
```

#### Ejecución de los archivos
Abra una consola, viaje a la ubicacion del archivo y ejecute ```runhaskell TweeKell```, la aplicación deberia de iniciarse.

Si desea utilizar `ghci`, cargue el archivo con ```:l TweeKell``` y ejecute ```main```, la aplicación deberia de iniciarse al igual que con el método anterior


## Archivos del repositorio


  * ```TweeKell.hs```
    Archivo principal del programa, contiene una función main que llama al menu principal del módulo MenuInteractivo.

  * ```MenuInteractivo.hs```
    Módulo encargado de generar los menús interactivos del programa además de recibir las instrucciones del usuario y llamar a la lógica correcta.

  * ```TiposDatos.hs```
    Módulo encargado de definir los tipos de datos que se utilizan para decodificar los archivos JSON y mostrar la información.

  * ```TiposDatos2.hs```
    Igual que TiposDatos, con la única diferencia de que este contiene las definiciones de los tipos de datos que producen alguna colisión en caso de que se encontrasen en TiposDatos.

  * ```ParsersArchivos.hs```
    Módulo encargado de parsear los archivos JSON de Twitter y de crear los objetos de los tipos que se definen en TiposDatos y TiposDatos2.

  * ```AnalisisSimples.hs```
    Módulo encargado de recibir el parseado realizado por ParsersArchivos y analizar y mostrar la información que el usuario ha solicitado para todos los tipos de análisis excepto para los que dependen de Tweets.

  * ```AnalisisTweets.hs```
    Igual que AnalisisSimples pero centrado en los que dependen del tipo Tweet.


## Documentación
La documentación del proyecto se encuentra en el archivo Documentacion.pdf

## Información del autor
El trabajo ha sido realizado por el alumno Juan Arteaga Carmona, estudiante del grado de Ingeniería Informática - Tecnologías Informaticas, de la Universidad de Sevilla.
