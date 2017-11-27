#!/bin/bash

rm -rf ./public
if [ "$DRONE" == "true"  ]; then
    cd ./public
    git init
    git config user.name "okapie"
    git config user.email "tatigreuze@yahoo.co.jp"
    git remote add upstream "https://$GH_TOKEN@github.com/okapie/okapie.github.io.git"
    git fetch upstream
    git reset upstream/master

    # ls -la
    git add -A .
    git commit ./ -m "Deploy to gh-pages"
    git push -q upstream HEAD:master
fi