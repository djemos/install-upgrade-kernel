#!/bin/sh

intltool-extract --type="gettext/ini" install-upgrade-kernel.desktop.in
xgettext --from-code=utf-8 -L shell -o po/install-upgrade-kernel.pot src/install-upgrade-kernel
xgettext --from-code=utf-8 -j -L C -kN_ -o po/install-upgrade-kernel.pot install-upgrade-kernel.desktop.in.h

rm install-upgrade-kernel.desktop.in.h

cd po
for i in `ls *.po`; do
	msgmerge -U $i install-upgrade-kernel.pot
done
rm -f ./*~

