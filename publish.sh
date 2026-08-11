#!/bin/bash

set -e

# Derive the image version tag from Cargo.toml so :latest always has a
# pinnable immutable counterpart to roll back to.
VERSION="${VERSION:-$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)}"

docker buildx build --platform=linux/amd64,linux/arm64 \
    -t start9/cargo-zigbuild \
    -t "start9/cargo-zigbuild:$VERSION" \
    . --push
