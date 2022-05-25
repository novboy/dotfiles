export node=ed
export network=$ZERO_NETWORK
docker rm -f zero_$node
docker run --name zero_$node -d --restart=always --device=/dev/net/tun --net=host \
  --cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
  -v $HOME/$node-conf:/var/lib/zerotier-one zyclonite/zerotier

if [ ! -d "$HOME/$node-conf/networks.d" ]; then
 echo "start join network"
 sleep 5
 docker exec zero_$node zerotier-cli join $network
fi