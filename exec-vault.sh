#!/bin/bash
kubectl -n vault exec -it vault-$1 -- /bin/sh
