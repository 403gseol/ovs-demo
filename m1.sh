#!/bin/bash

sudo cp /vagrant/setupRyu.service /etc/systemd/system/setupRyu.service
sudo systemctl enable setupRyu
sudo systemctl start setupRyu
docker container kill c1 && docker container prune -f

sudo ovs-vsctl del-br br0
sudo ovs-vsctl add-br br0
sudo ovs-vsctl add-port br0 enp0s8
sudo ip address add 172.20.0.1/24 dev br0
sudo ovs-vsctl set-fail-mode br0 secure
sudo ovs-vsctl set-controller br0 tcp:172.20.0.1:6633

docker run -itd -p 8000:8000 -v $(pwd)/zenoh:/root/.zenoh --name c1 eclipse/zenoh
sleep 2 
curl -X PUT -H 'content-type:application/properties' -d 'path_expr=/demo/example/**' http://localhost:8000/@/router/local/plugin/storages/backend/memory/storage/my-storage
sudo ovs-docker add-port br0 eth1 c1 --ipaddress="172.20.0.11/24"
