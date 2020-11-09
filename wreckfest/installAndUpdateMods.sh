#!/bin/bash

if [ -f /steam/config/steammods.txt ]; then
    for mod in $(cat /steam/config/steammods.txt); do
        echo "Installing/updating mod $mod"
        /steam/steamcmd_linux/steamcmd.sh +login anonymous +force_install_dir /steam/wreckfest/mods/ +workshop_download_item 228380 $mod validate +quit || exit 1
        if [ ! -L /steam/wreckfest/mods/$mod ]; then
            ln -s /steam/wreckfest/mods/steamapps/workshop/content/228380/$mod/ /steam/wreckfest/mods/$mod
        fi
    done
fi