elif [ "$exportado" = "LUMA" ]; then
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
  #Comprobando la región
  if [[ "$REGION" = "USA" ]]; then
    mkdir -p "SD/luma/titles/$USA/foldersample"
    cp "../parches/code.ips" "SD/luma/titles/$USA/code.ips"
    cp "extraido/romfs/filesample" "SD/luma/titles/$USA/romfs/filesample"
    cp -r "SD/luma" "$USER_PWD/rom/luma"
  else
    mkdir -p "SD/luma/titles/$EUR/foldersample"
    cp "../parches/code.ips" "SD/luma/titles/$EUR/codepatchsample.ips"
    cp "extraido/romfs/layout/ui_Achieve.arc" "SD/luma/titles/$EUR/romfs/filesample"
    cp -r "SD/luma" "$USER_PWD/rom/luma"
  fi
echo "Se ha creado el parche para luma, copia la carpeta luma que está en la carpeta rom a la raiz de la SD."
echo "Recuerda activar el Game Patching en los ajustes de luma para que funcione correctamente el parche."
echo "Disfruta del juego y de la traducción ^^"
