#!/bin/bash
# Creación de carpetas
if [ ! -d "$USER_PWD/rom" ]; then
  mkdir "$USER_PWD/rom"
fi
echo
echo
echo -e "\e[1;36m #####                       #######                                                                        \e[0m";
echo -e "\e[1;36m#     # #       ####  #    #    #    #####    ##   #    #  ####  #        ##   ##### #  ####  #    #  ####  \e[0m";
echo -e "\e[1;36m#       #      #    # #    #    #    #    #  #  #  ##   # #      #       #  #    #   # #    # ##   # #      \e[0m";
echo -e "\e[1;36m#  #### #      #    # #    #    #    #    # #    # # #  #  ####  #      #    #   #   # #    # # #  #  ####  \e[0m";
echo -e "\e[1;36m#     # #      #    # # ## #    #    #####  ###### #  # #      # #      ######   #   # #    # #  # #      # \e[0m";
echo -e "\e[1;36m#     # #      #    # ##  ##    #    #   #  #    # #   ## #    # #      #    #   #   # #    # #   ## #    # \e[0m";
echo -e "\e[1;36m #####  ######  ####  #    #    #    #    # #    # #    #  ####  ###### #    #   #   #  ####  #    #  ####  \e[0m";
echo
echo -e "\e[1;36m                                            Juego - Versiontradu                                            \e[0m";
echo -e "\e[1;36m                                      Versión del programa: 1.0 64 bits                                     \e[0m";
echo
echo
echo
echo "Introduzca el nombre y extensión del dump."
read -p 'Archivo: ' CXI
if [ -e "$USER_PWD/rom/$CXI" ]; then
     echo "Leyendo $CXI..."
else
   echo "Aviso, el archivo seleccionado no existe, revisa si has introducido el archivo dentro de rom y tiene los permisos necesarios."
   exit
fi
case "$CXI" in
*.cxi ) 
        echo "El dump es formato CXI, no necesita ningún parcheo previo para garantizar la compatibilidad del parche de traducción."
		CXIPATCH=false
        ;;
*.3ds ) 
		echo "El dump es formato 3DS, se aplicará un parche adicional para que funcione correctamente con el parche de traducción."
		CXIPATCH=true
		;;
*)
        echo "La extensión introducida es desconocida para el programa, se saldrá del programa."
		exit
        ;;
esac
echo Introduzca la región del juego
echo -e "Seleccione una opción \e[1;33mUSA\e[0m o \e[1;34mEUR\e[0m."
read -p 'Región: ' REGION
if [ "$REGION" = "USA" ]; then
echo -e "Se ha seleccionado la región USA"
elif [ "$REGION" = "EUR" ]; then
echo -e "Se ha seleccionado la región \e[1;34mEUR\e[0m"
elif [ "$REGION" != "EUR","USA" ]; then
echo Has introducido un valor incorrecto, se saldrá del programa
exit
fi
#variables de regiones
USA=TITLEIDSAMPLE
EUR=TITLEIDSAMPLE
echo ¿Cómo desea que el juego sea exportado?
#echo Seleccione una opción: 3DS, CIA, HANS, LUMA, NTR
echo -e "Seleccione una opción: \e[1;36m3DS\e[0m, \e[1;32mCIA\e[0m, \e[1;31mLUMA\e[0m o \e[1;33mNTR\e[0m"
read -p 'Método: ' exportado
# Inicio de la operación
