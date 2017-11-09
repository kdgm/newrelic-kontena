#!/bin/bash

# Run this script to start or update the NewRelic Infrastructure monitor
# (newrelic-infra) on the master node.

function master_ssh {
  kontena master ssh -i $KONTENA_SSH_KEY $@
}

# master_ssh docker ps

master_ssh docker stop newrelic-infra || true

master_ssh docker rm newrelic-infra || true

# Use docker options from
# https://docs.newrelic.com/docs/infrastructure/new-relic-infrastructure/data-instrumentation/monitor-containers-underlying-hosts-coreos

master_ssh docker run \
    -d \
    --name newrelic-infra \
    --restart always \
    --network=host \
    -e NRIA_DISPLAY_NAME="kontena/master" \
    -e NRIA_LICENSE_KEY="$NEWRELIC_LICENSE" \
    -v "/:/host:ro" \
    -v "/var/run/docker.sock:/var/run/docker.sock" \
    newrelic/infrastructure:latest

# master_ssh docker logs -f newrelic-infra
