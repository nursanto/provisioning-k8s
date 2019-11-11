yum install -y -q epel-release 
yum install -y -q cockpit  cockpit-docker cockpit-kubernetes
yum install -y cockpit-storaged
systemctl enable cockpit.socket
systemctl restart cockpit.socket
