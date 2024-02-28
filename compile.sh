#!/bin/sh

for i in `ls po/*.po`;do
	echo "Compiling `echo $i|sed "s|po/||"`"
	msgfmt $i -o `echo $i |sed "s/.po//"`.mo
done

intltool-merge po/ -d -u install-upgrade-kernel.desktop.in install-upgrade-kernel.desktop
