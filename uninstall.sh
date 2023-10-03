#!/bin/bash
echo "Removing vault"
helm uninstall vault --namespace vault
sleep 10
echo "Removing pvcs"
kubectl -n vault delete pvc --all
