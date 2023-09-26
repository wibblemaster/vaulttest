#!/bin/bash
kubectl -n vault-test patch statefulset vault -p '{"spec":{"template":{"spec":{"containers":[{"name":"vault","image":"hashicorp/vault:1.14.0"}]}}}}'

