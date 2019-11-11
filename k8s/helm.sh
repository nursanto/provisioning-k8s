wget https://get.helm.sh/helm-v2.16.0-linux-amd64.tar.gz
tar xzf helm-v2.16.0-linux-amd64.tar.gz
cd linux-amd64/
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller


