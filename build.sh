#!/bin/bash
#Instalando los paquetes necesarios
#sudo apt install cmake libiconv-hook-dev libiconv-hook-dev openssl libssl-dev libcurl4-openssl-dev

#Creando carpetas necesarias
mkdir build
mkdir out

# Actualizando/Descargando las dependencias
cd "sources"
git clone --recursive https://github.com/megastep/makeself.git

#Compilando script principal
cd "script"
cat main.sh cia.sh 3ds.sh luma.sh ntr.sh check.sh > "../../build/script.sh"
cd ../..
#Cifrando script principal
mkdir "build/out"
"sources/tools/shc64" -o "build/out/parcheador.run" -f "build/script.sh"

#Creando carpetas necesarias
mkdir -p "build/out/temp/extraido"
mkdir -p "build/out/temp/original"
mkdir -p "build/out/temp/parcheado"

#Copiando archivos necesarios
cp -r "sources/patch" "build/out/parches"
cp -r "sources/prebuild" "build/out/binarios"

#Comprimiendo todo
"sources/makeself/makeself.sh" "build/out" "out/ParcheadorLOM.run" "Parcheador Lord Of Magna - Maiden Heaven español" ./parcheador.run