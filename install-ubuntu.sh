cd "$(dirname $0)"
if [ ! -f "./bin/Release/raster2ddst" ]; then
	echo "No filter binary found - compile cb project first"
	echo "codeblocks --build --target=Release ./raster2ddst.cbp"
	exit 0
fi

if [ "$(whoami)" != "root" ]; then
	echo "Must run as root"
	exit 0
fi

cp ./bin/Debug/raster2ddst /lib/cups/filter/raster2ddst
chmod a+rx /lib/cups/filter/raster2ddst
cp SPC240DN.ppd /usr/share/ppd/cupsfilters/SPC240DN.ppd
chmod a+r /usr/share/ppd/cupsfilters/SPC240DN.ppd
cp SPC240DN.icc /usr/share/color/icc/SPC240DN.icc
chmod a+r  /usr/share/color/icc/SPC240DN.icc
