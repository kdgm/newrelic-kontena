#!/bin/sh

set -e

export NRIA_DISPLAY_NAME="kontena/${KONTENA_GRID_NAME}/${KONTENA_NODE_NAME}"

exec "$@"
