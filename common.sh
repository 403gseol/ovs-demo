#!/bin/bash

apt update
apt install -y avahi-daemon libnss-mdns docker.io openvswitch-switch python3-pip can-utils linux-modules-extra-$(uname -r) net-tools curl
echo "wireshark-common wireshark-common/install-setuid boolean true" | sudo debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark

pip3 install ryu flask eventlet==0.30.2 python-can
cp /vagrant/setupVcan.service /etc/systemd/system/setupVcan.service
cp /vagrant/setupVCAN0.sh /usr/sbin/setupVCAN0.sh
cp /vagrant/vcan.netdev /etc/systemd/network/vcan.netdev
ip link add dev vcan0 type vcan
systemctl enable setupVcan
systemctl start setupVcan
usermod -aG docker,wireshark vagrant

docker pull eclipse/zenoh

