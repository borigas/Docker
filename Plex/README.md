Run with:

`docker run --restart=always -d --name plex --network=host -e TZ="US/Central" -v /home/ben/Plex/config:/config -v /home/ben/Plex/transcode:/transcode -v /media/PlexMedia:/data plexinc/pms-docker`
