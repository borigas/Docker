Run with:

`docker run --name=transmission --restart=always --cap-add=NET_ADMIN --device=/dev/net/tun -d -v /media/PlexMedia:/data -e OPENVPN_PROVIDER=PIA -e OPENVPN_CONFIG=Netherlands -e OPENVPN_USERNAME=[PIA_VPN_USERNAME] -e OPENVPN_PASSWORD=[PIA_VPN_PASSWORD] -e WEBPROXY_ENABLED=false -e LOCAL_NETWORK=192.168.0.0/16 -e TRANSMISSION_RPC_AUTHENTICATION_REQUIRED=true -e TRANSMISSION_RPC_USERNAME=[WEB_USERNAME] -e TRANSMISSION_RPC_PASSWORD=[WEB_PASSWORD] --log-driver json-file --log-opt max-size=10m -p 9091:9091 haugene/transmission-openvpn`
