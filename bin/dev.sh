#!/bin/bash -xe

cd "$(dirname "$0")/.."

rm -rf _site/

docker build -t armory/documentation .

docker run --rm -ti \
  --name=documentation \
  -p 4000:4000 -p 5678:5678 \
  -v "$(pwd):/srv/jekyll" armory/documentation \
  jekyll serve --watch --incremental --livereload --reload_port 5678
