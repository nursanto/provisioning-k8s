yum install -y -q epel-release  >/dev/null 2>&1 
yum install -y -q cockpit  cockpit-docker cockpit-kubernetes  >/dev/null 2>&1
yum install -y -q  cockpit-storaged  >/dev/null 2>&1
systemctl enable cockpit.socket  >/dev/null 2>&1
systemctl restart cockpit.socket  >/dev/null 2>&1
