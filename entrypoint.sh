#!/bin/sh

set -e

main(){
  # Extract the base64 encoded config data and write this to the KUBECONFIG
  echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
  export KUBECONFIG=/tmp/config
  
  
  if uses "${INPUT_NAMESPACE}"; then
     echo "${INPUT_USERNAME}"
     sh -c "kubectl -n '${INPUT_NAMESPACE}' $*"
  else
     echo "no name space provided"
     sh -c "kubectl $*"
  fi
}

main

