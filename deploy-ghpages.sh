#!/bin/bash
rm -rf out || exit 0;
mkdir out;
npm run build;
( cd out
 git init
 git config user.name "Travis-CI"
 git config user.email "vincentriemer@gmail.com"
 cp ../index.html ./index.html
 git add .
 git commit -m "Deployed to Github Pages"
 git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
)