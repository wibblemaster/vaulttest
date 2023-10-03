#!/bin/bash
echo "Initialising cluster"
kubectl -n vault exec -it vault-0 -- vault operator init > keys.txt

cat keys.txt
echo -n "Extracting root token: "
ADMINTOKEN=$(grep Root\ Token keys.txt | cut -d' ' -f4)
echo $ADMINTOKEN

echo "Applying keys"
for i in $(grep Recovery keys.txt | cut -d' ' -f4 | head -3)
do
  kubectl -n vault exec -it vault-0 -- vault operator unseal $i
done

echo "Adding other nodes to cluster"
kubectl -n vault exec -it vault-1 -- vault operator raft join http://vault-0.vault-internal:8200
kubectl -n vault exec -it vault-2 -- vault operator raft join http://vault-0.vault-internal:8200

kubectl -n vault exec -it vault-0 -- vault login $ADMINTOKEN
kubectl -n vault exec -it vault-0 -- vault operator raft list-peers
