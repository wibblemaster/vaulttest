#!/bin/bash
kubectl -n vault patch statefulset vault -p '{"spec":{"template":{"spec":{"containers":[{"name":"vault","image":"hashicorp/vault:1.15.0"}]}}}}'
