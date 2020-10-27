#!/bin/bash

echo "Sourcing handler script from entrypoint.sh"

#shellcheck disable=SC1090
source "${HANDLER_SCRIPT:?'Environment variable HANDLER_SCRIPT not set'}"
