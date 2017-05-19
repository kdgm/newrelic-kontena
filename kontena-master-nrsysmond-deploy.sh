#!/bin/bash

# Run this script to start or update the NewRelic system monitor (nrsysmond)
# on the master node.

function master_ssh {
  kontena master ssh -i $KONTENA_SSH_KEY $@
}

# master_ssh docker ps

master_ssh docker stop nrsysmond

master_ssh docker rm nrsysmond

# Use dockerk options from
# https://github.com/christian-blades-cb/newrelic-docker/blob/master/newrelic.service

master_ssh docker run \
    -d \
    --name nrsysmond \
    --restart always \
    --pid=host \
    --net=host \
    --privileged=true \
    -e NRSYSMOND_hostname=kontena/master \
    -e NRSYSMOND_license_key=$NEWRELIC_LICENSE \
    -e NRSYSMOND_cgroup_style=0 \
    -v /dev:/dev:ro \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    christianbladescb/newrelic-coreos

    # -e NRSYSMOND_loglevel=debug \
    # -e NRSYSMOND_host_root=/host \
    # -e NRSYSMOND_cgroup_root=/host/sys/fs/cgroup \

# master_ssh docker logs -f nrsysmond
