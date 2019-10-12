M_DIR=$HOME/tanzu-lab/deploy/out

cc() {
  export KUBECONFIG=$M_DIR/$1/kubeconfig
  echo "KUBECONFIG is updated to '$KUBECONFIG'"
}
