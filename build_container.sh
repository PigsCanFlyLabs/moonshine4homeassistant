#!/bin/bash
MYORG=${MYORG:-holdenk}
VERSION=${VERSION:-latest}
BUILDX_CMD=${BUILDX_CMD:-push}
PLATFORM=${PLATFORM:-linux/amd64,linux/arm64}
docker buildx build --platform="${PLATFORM}" -t "${image}" -f "${dockerfile}" "--${BUILDX_CMD}" --build-arg MYORG="${MYORG}" .
