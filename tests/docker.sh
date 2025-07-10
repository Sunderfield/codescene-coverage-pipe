#!/bin/bash
# found this at https://blog.brazdeikis.io/posts/docker-image-tests/ 
set -eo pipefail

[ "$DEBUG" ] && set -x

# set current working directory to the directory of the script
cd "$(dirname "$0")"

dockerImage=$1

echo "Testing $dockerImage..."

if ! docker inspect "$dockerImage" &> /dev/null; then
    echo $'\timage does not exist!'
    false
fi

if ! docker run --rm "$dockerImage" version &> /dev/null; then
    echo $'\timage does not run!'
    false
fi

