#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=192.168.26.121 --pod-network-cidr=172.17.0.0/16 >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to Vagrant user .kube directory"
mkdir /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config

# Deploy flannel network
echo "[TASK 3] Deploy Calico network"
kubectl create -f /tmp/k8s/calico.yaml

# Generate Cluster join command
echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /joincluster.sh
