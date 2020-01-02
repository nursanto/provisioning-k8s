yum -y -q install haproxy nfs-utils > /dev/null 2>&1
mkdir -p /srv/nfs/kubedata
chmod -R 777 /srv/nfs/
cat  >>/etc/exports<<EOF
/srv/nfs/kubedata       *(rw,sync,no_subtree_check,insecure)
EOF

cat  >>/etc/haproxy/haproxy.cfg<<EOF
frontend nodeport
  bind *:30000-32767
  default_backend nodeport
  mode tcp
  option tcplog

backend nodeport
  balance roundrobin
  server kworker1 172.42.42.101
  server kworker2 172.42.42.102

frontend dashboard
  bind *:32323
  option tcplog
  mode tcp
  default_backend dashboard

backend dashboard
  mode tcp
  option ssl-hello-chk
  balance roundrobin
  server kworker1 172.42.42.101:32323 check
  server kworker2 172.42.42.102:32323 check
EOF

systemctl start rpcbind nfs-server haproxy > /dev/null 2>&1
systemctl enable rpcbind nfs-server haproxy > /dev/null 2>&1

exportfs -v > /dev/null 2>&1
showmount -e