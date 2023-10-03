#!/bin/bash
export ADMINTOKEN=$(grep Root\ Token keys.txt | cut -d' ' -f4)
CMD="kubectl -n vault exec -it vault-0 -- vault login $ADMINTOKEN"
echo $CMD
kubectl -n vault exec -it vault-0 -- vault operator raft list-peers
