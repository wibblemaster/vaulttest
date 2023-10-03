#!/bin/bash
KEY=$(cat ~/.aws/credentials | grep aws_access_key_id | cut -f3 -d' ')
ACCESS=$(cat ~/.aws/credentials | grep aws_secret_access_key | cut -f3 -d' ')

kubectl -n vault delete secret eks-cred
kubectl -n vault create secret generic eks-cred --from-literal=AWS_ACCESS_KEY_ID="$KEY" --from-literal=AWS_SECRET_ACCESS_KEY="$ACCESS"

aws kms create-key > key_details.txt
cat key_details.txt | grep KeyId | cut -d'"' -f4
