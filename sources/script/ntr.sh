elif [ "$exportado" = "NTR" ]; then
	if [[ "$CXIPATCH" = true ]]; then
	echo -e "\e[1;36mExtrayendo 3DS...\e[0m"
	'binarios/3dstool' -xtf cci "$USER_PWD/rom/$CXI" --header 'temp/original/ncsdheader.bin' -0 'temp/original/game.cxi' -1 'temp/original/manual.cfa' -2 'temp/original/dlpchild.cfa'
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
  	'binarios/3dstool' -xtf cxi 'temp/original/game.cxi' --header 'temp/original/ncchheader.bin' --exh 'temp/original/exheader.bin' --exefs 'temp/original/exefs.bin' --romfs 'temp/original/romfs.bin' --logo 'temp/original/logo.bcma.lz' --plain 'temp/original/plain.bin'
	cd "temp/parcheado"
	else
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
  	'binarios/3dstool' -xtf cxi "$USER_PWD/rom/$CXI" --header 'temp/original/ncchheader.bin' --exh 'temp/original/exheader.bin' --exefs 'temp/original/exefs.bin' --romfs 'temp/original/romfs.bin' --logo 'temp/original/logo.bcma.lz' --plain 'temp/original/plain.bin'
	cd "temp/parcheado"
	fi
  echo -e "\e[1;32mParcheando el juego...\e[0m"
  "../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
  "../../binarios/xdelta3" -n -d -s '../original/exheader.bin' '../../parches/exheaderEUR.xdelta' exheader.bin
  echo -e "\e[1;31mExtrayendo romFS...\e[0m"
  '../../binarios/3dstool' -xtf romfs 'romfs.bin' --romfs-dir '../extraido/romfs'
  cd ..
 #Comprobando la región
  if [[ "$REGION" = "USA" ]]; then
  	mkdir -p "SD/luma/titles/$USA"
    cp -r "../parches/code.ips" "SD/luma/titles/$USA/code.ips"
	cp -r "parcheado/exheader.bin" "SD/luma/titles/$USA/exheader.bin"
	else
	mkdir -p "SD/luma/titles/$EUR"
	cp "../parches/code.ips" "SD/luma/titles/$EUR/code.ips"
	cp "parcheado/exheader.bin" "SD/luma/titles/$EUR/exheader.bin"
  fi
  mkdir -p "$USER_PWD/rom/SDNTR/GlowTranslations/LOM"
  cp -r "../parches/NTR/plugin" "$USER_PWD/rom/SDNTR/plugin"
  cp -r "SD/luma" "$USER_PWD/rom/SDNTR/luma"
  cd "extraido/romfs"
  for file in $(<../../../parches/lista.txt); do cp --parents $file $USER_PWD/rom/SDNTR/GlowTranslations/LOM; done
  cd ../..
  echo "Se ha creado el parche para NTR, copia lo que hay dentro de SDNTR que está en la carpeta rom a la raiz de la SD."
  echo "Recuerda que el método NTR necesita el CFW LUMA y activar el Game Patching en los ajustes de luma para que funcione correctamente el parche."
  echo "Disfruta del juego y de la traducción ^^"
  exit
  