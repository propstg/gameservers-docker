#!/bin/bash

if [ ! -f /steam/config/server_config.cfg ]; then
    /steam/wreckfest/createConfig.sh
fi

/steam/wreckfest/installAndUpdateMods.sh

exec wine Wreckfest.exe -s server_config=/steam/config/server_config.cfg
