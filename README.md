# TweeKell - Análisis de los datos privados de una cuenta de Twitter con Haskell
Repositorio para los archivos y la documentación del trabajo de curso de la asignatura PD del grado de Ingeniería Informática - Tecnologías Informáticas.

# Índice
* [Ejecución del programa](#ejecución-del-programa)
   * [Utilizando el archivo binario compilado](#utilizando-el-archivo-binario-compilado)
   * [Utilizando el código fuente](#utilizando-el-código-fuente)
      * [Dependencias](#dependencias)
      * [Ejecución de los archivos](#ejecución-de-los-archivos)
* [Archivos del repositorio](#archivos-del-repositorio)
* [Documentación](#documentación)
* [Información del autor](#información-del-autor)




## Ejecución del programa
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

## Documentación
La documentacion del proyecto se encuentra en el archivo Documentacion.pdf

## Información del autor
El trabajo ha sido realizado por el alumno Juan Arteaga Carmona, estudiante del grado de Ingeniería Informática - Tecnologías Informaticas, de la Universidad de Sevilla.
