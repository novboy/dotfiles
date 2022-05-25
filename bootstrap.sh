docker start zero_ed
export FLANNEL_IFACE="$(ip l | grep 'zt' | awk '{print substr($2,1,length($2)-1)}')"
curl -sfL https://get.k3s.io | sh -s - --flannel-iface ${FLANNEL_IFACE}
#sudo systemctl stop k3s-agent
#sudo systemctl start k3s-agent
sudo k3s agent \
--node-name $K3S_NODE  \
--node-label region=sp \
--node-label name=$K3S_NODE \
--node-label env=dev \
--node-label cloud=azure  \
--server $K3S_URL --docker \
--token ${K3S_TOKEN}  --flannel-iface ${FLANNEL_IFACE}
