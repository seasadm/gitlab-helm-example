#!/bin/sh

set -ex

docker build -f .infra/Dockerfile             \
  --build-arg BUILDKIT_INLINE_CACHE=1  \
  -t ${IMAGE_NAME}                     \
  .
docker push ${IMAGE_NAME}
