#!/bin/sh

set -e

export NRSYSMOND_hostname="${KONTENA_GRID_NAME}/${KONTENA_NODE_NAME}"

exec "$@"
