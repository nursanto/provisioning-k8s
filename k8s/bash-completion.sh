yum -y -q install bash-completion
source /usr/share/bash-completion/bash_completion
type _init_completion 2>&1 /dev/null
echo 'source <(kubectl completion bash)' >>~/.bashrc
kubectl completion bash > /etc/bash_completion.d/kubectl
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -F __start_kubectl k' >>~/.bashrc

