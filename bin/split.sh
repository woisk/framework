#!/usr/bin/env bash

set -e
set -x

CURRENT_BRANCH="1.0.0"

function split()
{
    SHA1=`./bin/splitsh-lite --prefix=$1`
    git push $2 "$SHA1:refs/heads/$CURRENT_BRANCH" -f
}

function remote()
{
    git remote add $1 $2 || true
}

git pull origin $CURRENT_BRANCH

remote jwt git@github.com:woisks/jwt.git
remote throttle git@github.com:woisks/throttle.git


split 'src/Woisks/JWT' jwt
split 'src/Woisks/Throttle' throttle

