kubecfg_management() {
  export DEPLOY=$HOME/tanzu-lab/deploy

  export MANAGEMENT_CLUSTER=''
  for f in $(ls -d $DEPLOY/management-cluster/out/*)
  do
    MANAGEMENT_CLUSTER=$(basename $f)
    break
  done

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

