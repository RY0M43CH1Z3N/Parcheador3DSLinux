#!/bin/bash
#Requisitos necesarios
#echo -e "Parcheador 3DS Linux versión 1.1 - Creado por Darkmet98."
#echo
#echo -e "Introduzca el nombre del juego traducido."
#read -p 'Juego traducido: ' GAME
#echo
#echo -e "Introduzca la versión del parche del juego traducido."
#read -p 'Versión: ' VERSION
#echo
#echo -e "Introduzca una abreviatura del juego (por ejemplo, STG)."
#read -p 'Abreviatura del juego: ' CODE
#echo
#echo -e "Introduzca el nombre del equipo que lo ha traducido."
#read -p 'Equipo que lo ha traducido: ' TEAM
#echo
GAME='Lord Of Magna Maiden Heaven'
VERSION='1.0'
CODE='LOM'
TEAM='GlowTranslations'

#Creando carpetas necesarias y limpiando las viejas
if [ ! -d "build" ]; then
	mkdir "build"
	rm -Rf "out"
	mkdir "out"
else
	rm -Rf "build"
	rm -Rf "out"
	mkdir "build"
	mkdir "out"
fi

# Actualizando/Descargando las dependencias
cd "sources"
if [ ! -d "makeself" ]; then
	git clone --recursive https://github.com/megastep/makeself.git
else
	rm -Rf "makeself"
	git clone --recursive https://github.com/megastep/makeself.git
fi
#Compilando script principal
mkdir -p "../build/out"
cd "script"
echo "#!/bin/bash" >> '../../build/out/script.sh'
echo "#Variables exportadas por el programa" >> '../../build/out/script.sh'
echo "GAME='$GAME'" >> '../../build/out/script.sh'
echo "VERSION='$VERSION'" >> '../../build/out/script.sh'
echo "CODE='$CODE'" >> '../../build/out/script.sh'
echo "TEAM='$TEAM'" >> '../../build/out/script.sh'
cat main.sh cia.sh 3ds.sh luma.sh ntr.sh check.sh >> "../../build/out/script.sh"
cd ../..

#Creando carpetas necesarias
mkdir -p "build/out/temp/extraido"
mkdir -p "build/out/temp/original"
mkdir -p "build/out/temp/parcheado"

#Copiando archivos necesarios
cp -r "sources/patch" "build/out/parches"
cp -r "sources/prebuild" "build/out/binarios"

#Comprimiendo todo
"sources/makeself/makeself.sh" "build/out" "out/Parcheador$CODE.run" "Parcheador $GAME al español" ./script.sh