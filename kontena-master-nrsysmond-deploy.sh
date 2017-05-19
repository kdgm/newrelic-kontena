#!/bin/bash

# To run NewRelic system monitor (nrsysmond) on the master node
# start the christianbladescb/newrelic-coreos image

kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker stop nrsysmond

kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker rm nrsysmond

# Use settings from
# https://github.com/christian-blades-cb/newrelic-docker/blob/master/newrelic.service

kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker run \
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

# kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
#   docker logs -f nrsysmond
