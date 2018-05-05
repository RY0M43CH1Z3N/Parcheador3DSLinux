elif [ "$exportado" = "3DS" ]; then
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
	if [[ "$REGION" = "USA" ]]; then
		echo -e "\e[1;32mParcheando el juego...\e[0m"
		"../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
		"../../binarios/xdelta3" -d -s '../original/exefs.bin' '../../parches/exefsUSA.xdelta' exefs.bin
		"../../binarios/xdelta3" -n -d -s '../original/exheader.bin' '../../parches/exheaderUSA.xdelta' exheader.bin
	else
		echo -e "\e[1;32mParcheando el juego...\e[0m"
		"../../binarios/xdelta3" -d -s '../original/romfs.bin' '../../parches/romfs.xdelta' romfs.bin
		"../../binarios/xdelta3" -d -s '../original/exefs.bin' '../../parches/exefsEUR.xdelta' exefs.bin
		"../../binarios/xdelta3" -n -d -s '../original/exheader.bin' '../../parches/exheaderEUR.xdelta' exheader.bin
	fi
  echo -e "\e[1;31mCreando 3DS...\e[0m"
  '../../binarios/3dstool' -ctf cxi parcheado.cxi --header '../../temp/original/ncchheader.bin' --exh exheader.bin --logo '../../temp/original/logo.bcma.lz' --plain '../../temp/original/plain.bin' --exefs exefs.bin --romfs romfs.bin
  '../../binarios/makerom' -f cci -o "$USER_PWD/rom/$GAME ESP - $REGION.3ds" -target t -i parcheado.cxi:0
  cd ../..
  echo "Se ha exportado el $GAME ESP - $REGION.3ds parcheado con la traducción dentro de la carpeta rom :D"
  echo "Disfruta del juego y de la traducción ^^"
  exit
  