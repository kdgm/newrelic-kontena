#!/bin/sh

set -e

export NRSYSMOND_hostname="kontena/${KONTENA_GRID_NAME}/${KONTENA_NODE_NAME}"

exec "$@"
