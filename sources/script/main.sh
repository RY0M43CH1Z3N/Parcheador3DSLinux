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
echo -e "\e[1;36m $GAME al español - $VERSION \e[0m";
echo -e "\e[1;36m Traducido por $TEAM \e[0m";
echo -e "\e[1;36m Versión del programa: 1.2 64 bits \e[0m";
echo
echo
echo
echo "Introduzca el nombre y extensión del dump."
read -p 'Archivo: ' CXI
if [ -e "$USER_PWD/rom/$CXI" ]; then
	echo
     echo "Leyendo $CXI..."
else
	echo
   echo "Aviso, el archivo seleccionado no existe, revisa si has introducido el archivo dentro de rom y tiene los permisos necesarios."
   exit
fi
echo
case "$CXI" in
*.cxi ) 
		echo
        echo "El dump es formato CXI."
		CXIPATCH=false
        ;;
*.3ds ) 
		echo
		echo "El dump es formato 3DS."
		CXIPATCH=true
		;;
*)
		echo
        echo "La extensión introducida es desconocida para el programa, se saldrá del programa."
		exit
        ;;
esac
echo
echo Introduzca la región del juego
echo -e "Seleccione una opción \e[1;33mUSA\e[0m o \e[1;34mEUR\e[0m."
read -p 'Región: ' REGION
if [ "$REGION" = "USA" ]; then
echo
echo -e "Se ha seleccionado la región USA"
elif [ "$REGION" = "EUR" ]; then
echo
echo -e "Se ha seleccionado la región \e[1;34mEUR\e[0m"
elif [ "$REGION" != "EUR","USA" ]; then
echo
echo Has introducido un valor incorrecto, se saldrá del programa
exit
fi
#variables de regiones
USA=0004000000164300
EUR=0004000000165500
echo
echo ¿Cómo desea exportar el juego?
#echo Seleccione una opción: 3DS, CIA, HANS, LUMA, NTR
echo
echo -e "Seleccione una opción: \e[1;36m3DS\e[0m, \e[1;32mCIA\e[0m, \e[1;31mLUMA\e[0m o \e[1;33mNTR\e[0m"
read -p 'Método: ' exportado
# Inicio de la operación
