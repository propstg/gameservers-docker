#!/bin/bash

if [ ! -f /steam/config/server_config.cfg ]; then
    /steam/wreckfest/createConfig.sh
fi

/steam/wreckfest/updateServer.sh
/steam/wreckfest/installAndUpdateMods.sh

exec wine server/Wreckfest.exe -s server_config=/steam/config/server_config.cfg
