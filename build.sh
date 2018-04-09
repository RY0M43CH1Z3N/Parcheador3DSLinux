#!/bin/bash

#Creando carpetas necesarias
mkdir build
mkdir out

# Actualizando/Descargando las dependencias
cd "sources"
git clone --recursive https://github.com/megastep/makeself.git

#Compilando script principal
mkdir -p "../build/out"
cd "script"
cat main.sh cia.sh 3ds.sh luma.sh ntr.sh check.sh > "../../build/out/script.sh"
cd ../..

#Creando carpetas necesarias
mkdir -p "build/out/temp/extraido"
mkdir -p "build/out/temp/original"
mkdir -p "build/out/temp/parcheado"

#Copiando archivos necesarios
cp -r "sources/patch" "build/out/parches"
cp -r "sources/prebuild" "build/out/binarios"

#Comprimiendo todo
"sources/makeself/makeself.sh" "build/out" "out/Parcheador.run" "Parcheador español" ./script.sh