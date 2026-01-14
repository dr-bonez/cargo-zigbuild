#!/bin/bash

docker buildx build --platform=linux/amd64,linux/arm64 -t start9/cargo-zigbuild . --push
