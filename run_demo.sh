#!/bin/bash

set -eo pipefail
set -x

# Run from anywhere with relative paths
SRC_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")
cd "${SRC_DIR}"

# Patch the INSTANA_AGENT_HOST env var into kong.yml
export INSTANA_AGENT_HOST="instana-agent"
envsubst '{$INSTANA_AGENT_HOST}' < "./kong/kong.yml.in" > "./kong/kong.yml"

# Run the demo
docker-compose down && docker-compose up --build
