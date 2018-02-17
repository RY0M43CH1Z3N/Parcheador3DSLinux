elif [ "$exportado" = "3DS" ]; then
	if [[ "$CXIPATCH" = true ]]; then
	echo -e "\e[1;36mParcheando 3DS...\e[0m"
	cd "temp/parcheado"
	"../../binarios/xdelta3" -d -s "$USER_PWD/rom/$CXI" '../../parches/USA-3DStoCXI.xdelta' romparcheada.cxi
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
 	'../../binarios/3dstool' -xtf cxi "romparcheada.cxi" --header '../original/ncchheader.bin' --exh '../original/exheader.bin' --exefs '../original/exefs.bin' --romfs '../original/romfs.bin' --logo '../original/logo.bcma.lz' --plain '../original/plain.bin'
	else
	echo -e "\e[1;35mExtrayendo CXI...\e[0m"
  	'binarios/3dstool' -xtf cxi "$USER_PWD/rom/$CXI" --header 'temp/original/ncchheader.bin' --exh 'temp/original/exheader.bin' --exefs 'temp/original/exefs.bin' --romfs 'temp/original/romfs.bin' --logo 'temp/original/logo.bcma.lz' --plain 'temp/original/plain.bin'
	cd "temp/parcheado"
	fi
	if [[ "$REGION" = "USA" ]]; then
		echo -e "\e[1;32mParcheando el juego...\e[0m"
		"../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
		"../../binarios/xdelta3" -d -s '../original/exefs.bin' '../../parches/exefsUSA.xdelta' exefs.bin
	else
		echo -e "\e[1;32mParcheando el juego...\e[0m"
		"../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
		"../../binarios/xdelta3" -d -s '../original/exefs.bin' '../../parches/exefsEUR.xdelta' exefs.bin
	fi
  echo -e "\e[1;31mCreando 3DS...\e[0m"
  '../../binarios/3dstool' -ctf cxi parcheado.cxi --header '../../temp/original/ncchheader.bin' --exh '../../temp/original/exheader.bin' --logo '../../temp/original/logo.bcma.lz' --plain '../../temp/original/plain.bin' --exefs exefs.bin --romfs romfs.bin
  '../../binarios/makerom' -f cci -o "$USER_PWD/rom/juego$REGION.3ds" -target t -i parcheado.cxi:0
  cd ../..
  echo "Se ha exportado el juego$REGION.3ds parcheado con la traducción dentro de la carpeta rom :D"
  echo "Disfruta del juego y de la traducción ^^"
  