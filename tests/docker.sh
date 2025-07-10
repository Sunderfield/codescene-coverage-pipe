#!/bin/bash
# found this at https://blog.brazdeikis.io/posts/docker-image-tests/
set -eo pipefail

[ "$DEBUG" ] && set -x

# set current working directory to the directory of the script
cd "$(dirname "$0")"

dockerImage=$1

echo "Testing $dockerImage..."

if ! docker inspect "$dockerImage" &> /dev/null; then
    echo -e "\timage does not exist! ${dockerImage}"
    false
fi

if ! docker run --rm -e VERSION=true "$dockerImage" &> /dev/null; then
    echo -e "\timage does not run! ${dockerImage}"
    false
fi
