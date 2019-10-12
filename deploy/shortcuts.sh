M_DIR=$HOME/tanzu-lab/deploy/out
cc() {
  C=$1
  export KUBECONFIG=$M_DIR/$C/kubeconfig
}

source <(kubectl completion bash)

alias k=kubectl
complete -F __start_kubectl k

