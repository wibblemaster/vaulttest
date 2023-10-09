#!/bin/bash
for i in {0..2}
do
kubectl -n vault exec -it vault-$i -- vault login hvs.zvMuAeFVrSM7gzoc9ltyTjgh
kubectl -n vault exec -it vault-$i -- vault write sys/plugins/catalog/secret/vault-cert-plugin sha_256="8e38c53378aec5a5ed38e29a06385e27bd01747175402455318af50b7d57c137" command="vault-cert-plugin"
done
