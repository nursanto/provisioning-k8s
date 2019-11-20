yum -y -q install bash-completion  >/dev/null 2>&1
source /usr/share/bash-completion/bash_completion
type _init_completion 
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash > /etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc


echo 'source <(helm completion bash)' >>~/.bashrc
helm completion bash > /etc/bash_completion.d/helm

