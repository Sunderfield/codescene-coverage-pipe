#!/bin/bash

# Usage: ./setversion.sh <new_version>
# Example: ./setversion.sh 1.2.3

set -e

PIPE_YML="pipe.yml"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_version>"
    exit 1
fi

NEW_VERSION="$1"

if [ ! -f "$PIPE_YML" ]; then
    echo "Error: $PIPE_YML not found."
    exit 1
fi

# Update version tag in the image field of pipe.yml (e.g., image: name:tag)
sed -i.bak -E "s|(image:[[:space:]]*[^:]+:)[0-9]+\.[0-9]+\.[0-9]+|\1$NEW_VERSION|" "$PIPE_YML"

echo "Updated version to $NEW_VERSION in $PIPE_YML"
