elif [ "$exportado" = "NTR" ]; then
	if [[ "$CXIPATCH" = true ]]; then
	echo -e "\e[1;36mParcheando 3DS...\e[0m"
	cd "temp/parcheado"
	"../../binarios/xdelta3" -d -s "$USER_PWD/rom/$CXI" '../../parches/USA-3DStoCXI.xdelta' romparcheada.cxi
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
 	'../../binarios/3dstool' -xtf cxi "romparcheada.cxi" --romfs '../original/romfs.bin'
	else
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
  	'binarios/3dstool' -xtf cxi "$USER_PWD/rom/$CXI" --romfs '../original/romfs.bin'
	cd "temp/parcheado"
	fi
  echo -e "\e[1;32mParcheando el juego...\e[0m"
  "../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
  echo -e "\e[1;31mExtrayendo romFS...\e[0m"
  '../../binarios/3dstool' -xtf romfs 'romfs.bin' --romfs-dir '../extraido/romfs'
  cd ..
  mkdir -p "SD/sample"
  cp -r "../parches/NTR/plugin" "SD/plugin"
  cp "extraido/romfs/filesample" "SD/lordesp/filesample"
#Comprobando la región
  if [[ "$REGION" = "USA" ]]; then
  	mkdir -p "SD/luma/titles/$USA"
    cp "../parches/code.ips" "SD/luma/titles/$USA/code.ips"
	else
	mkdir -p "SD/luma/titles/$EUR"
	cp "../parches/code.ips" "SD/luma/titles/$EUR/code.ips"
  fi
  #Comprobando si existe la carpeta
  if [ ! -d "$USER_PWD/rom/SDNTR" ]; then
  mkdir "$USER_PWD/rom/SDNTR"
  else
  rm -Rf "$USER_PWD/rom/SDNTR"
   mkdir "$USER_PWD/rom/SDNTR"
  fi
  cp -r "SD/luma" "$USER_PWD/rom/SDNTR/luma"
  cp -r "SD/lordesp" "$USER_PWD/rom/SDNTR/sample"
  cp -r "SD/plugin" "$USER_PWD/rom/SDNTR/plugin"
  echo "Se ha creado el parche para NTR, copia lo que hay dentro de SDNTR que está en la carpeta rom a la raiz de la SD."
  echo "Recuerda que el método NTR necesita el CFW LUMA y activar el Game Patching en los ajustes de luma para que funcione correctamente el parche."
  echo "Disfruta del juego y de la traducción ^^"
  