export DEPLOY=$HOME/tanzu-lab/deploy

find_management_cluster() {
  for f in $(ls -d $DEPLOY/management-cluster/out/*)
  do
    echo $(basename $f)
    exit
  done
  echo 'WARNING: No management cluster found'
}

kubecfg_management() {
  export MANAGEMENT_CLUSTER=$(find_management_cluster)
  export KUBECONFIG=$DEPLOY/management-cluster/out/$MANAGEMENT_CLUSTER/kubeconfig
  echo KUBECONFIG=$KUBECONFIG
}

kubecfg_workload() {
  export KUBECONFIG=$DEPLOY/workload-cluster/out/$1/kubeconfig
  echo KUBECONFIG=$KUBECONFIG
}
  
source <(kubectl completion bash)

alias k=kubectl
complete -F __start_kubectl k

