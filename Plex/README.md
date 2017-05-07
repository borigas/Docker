Run with:

`docker run --restart=always -d --name plex --network=host -e TZ="US/Central" -v /mnt/PlexConfig:/config -v /mnt/DockerData/Plex/Transcode:/transcode -v /mnt/PlexMedia:/data plexinc/pms-docker`
