#!/bin/bash

# To run NewRelic system monitor (nrsysmond) on the master node
# start the christianbladescb/newrelic-coreos image

kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker stop nrsysmond

kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker rm nrsysmond


kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
  docker run --name nrsysmond -d --restart always \
    -e NRSYSMOND_hostname=kontena/master \
    -e NRSYSMOND_license_key=$NEWRELIC_LICENSE \
    -e NRSYSMOND_cgroup_style=0 \
    -e NRSYSMOND_host_root=/host \
    -e NRSYSMOND_cgroup_root=/host/sys/fs/cgroup \
    -e NRSYSMOND_loglevel=debug \
    -v /proc:/host/proc:ro \
    -v /dev:/host/dev:ro \
    -v /sys/fs/cgroup:/host/sys/fs/cgroup:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    christianbladescb/newrelic-coreos

# kontena master ssh -i $EC2_KEYS_DIR/kontena.pem \
#   docker logs -f nrsysmond
