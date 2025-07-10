#!/bin/bash

set -e


source "$(dirname "$0")/common.sh"
if [[ -n "$VERSION" && "$VERSION" == "true" ]]; then
    exec cs-coverage version
fi

if [[ -z "$CS_ACCESS_TOKEN" ]]; then
    echo "Error: CS_ACCESS_TOKEN environment variable is not set."
    exit 1
fi

if [[ -z "$FORMAT" || -z "$METRIC" ]]; then
    echo "Error: FORMAT and METRIC environment variables must be set."
    exit 1
fi

if [[ -n "$VERBOSE" && "$VERBOSE" == "true" ]]; then
    VERBOSECOMMAND="--verbose"
else
    VERBOSECOMMAND=""
fi

exec cs-coverage upload \
    $VERBOSECOMMAND \
    --format "$FORMAT" \
    --metric "$METRIC" \
    "$COVERAGE_FILE" \
