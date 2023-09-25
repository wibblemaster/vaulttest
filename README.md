# vaulttest
vault configuration for k8s

Example install

helm install vault hashicorp/vault --version 0.24.1 -f ./override-values.yaml --namespace vault
