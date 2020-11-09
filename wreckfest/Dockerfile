FROM wine

USER root


USER steam
WORKDIR /steam/steamcmd_linux
RUN mkdir -p /steam/wreckfest

RUN ./steamcmd.sh +login anonymous +@sSteamCmdForcePlatformType windows +force_install_dir ../wreckfest +app_update 361580  +quit

RUN mkdir -p /steam/config
VOLUME /steam/config
VOLUME /steam/wreckfest/mods

WORKDIR /steam/wreckfest
ADD start*.sh /steam/wreckfest/
ADD createConfig.sh /steam/wreckfest/
ADD updateServer.sh /steam/wreckfest/
ADD installAndUpdateMods.sh /steam/wreckfest/
CMD ["./start-wreckfest.sh"]
