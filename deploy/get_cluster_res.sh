for r in Cluster KubeadmConfig KubeadmConfigTemplate Machine MachineDeployment VSphereCluster VSphereMachine VSphereMachineTemplate
do
  echo
  echo "### $r"
  kubectl get $r
done
