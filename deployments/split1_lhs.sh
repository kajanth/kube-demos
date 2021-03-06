#!/usr/bin/env bash

. $(dirname ${BASH_SOURCE})/../util.sh

IP=$(kubectl --namespace=demos get svc deployment-demo \
        -o go-template='{{.spec.clusterIP}}')

run "gcloud compute ssh --zone=us-central1-b $SSH_NODE --command '\\
    while true; do \\
        curl --connect-timeout 1 -s $IP; \\
        sleep 0.5; \\
    done \\
    '"
