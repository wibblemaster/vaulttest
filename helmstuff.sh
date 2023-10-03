#!/bin/bash
helm install vault hashicorp/vault --version 0.25.0 -f ./override-values.yaml --namespace vault
