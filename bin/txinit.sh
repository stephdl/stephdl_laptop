#!/bin/bash

#
# Copyright (C) 2015 Nethesis S.r.l.
# http://www.nethesis.it - nethserver@nethesis.it
#
# This script is part of NethServer.
#
# NethServer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License,
# or any later version.
#
# NethServer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with NethServer.  If not, see COPYING.
#

if ! which tx; then
   echo "Transifex client not found. Install Transifex client." 2>&1
   exit 1
fi 

cfg=.tx/config
phpfiles=($(find */usr/share/nethesis/NethServer/Language/en/ -type f -name '*.php'))
potfiles=($(find locale/ -type f -name '*.pot'))

if ! [ -f "${cfg}" ]; then
    tx init
fi 

for src in ${potfiles[@]}; do
    grep -F "${src}" ${cfg} && continue
    resource=$(basename -s .pot ${src})pot
    echo "[nethserver.${resource}]
source_file = ${src}
source_lang = en
type = PO

" >> ${cfg}
done

for src in ${phpfiles[@]}; do
    grep -F "${src}" ${cfg} && continue    
    resource=$(basename -s .php ${src} | sed 's/NethServer_Module_//')
    echo "[nethserver.${resource}]
source_file = ${src}
source_lang = en
type = PHP_ALT_ARRAY

" >> ${cfg}
done

