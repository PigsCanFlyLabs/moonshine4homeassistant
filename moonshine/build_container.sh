#!/bin/bash
MYORG=${MYORG:-holdenk}
VERSION=${VERSION:-0.0.14b}
BUILDX_CMD=${BUILDX_CMD:-push}
PLATFORM=${PLATFORM:-linux/amd64,linux/arm64}
image="${MYORG}/moonshine4homeassistant:${VERSION}"
docker buildx build --platform="${PLATFORM}" -t "${image}" -f "${dockerfile}" "--${BUILDX_CMD}" .
