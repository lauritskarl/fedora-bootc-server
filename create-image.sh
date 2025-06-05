#!/usr/bin/bash
mkdir -p $(pwd)/output
sudo podman pull ghcr.io/lauritskarl/fedora-bootc-server:latest
sudo podman run \
    --rm \
    -it \
    --privileged \
    --pull=newer \
    --security-opt label=type:unconfined_t \
    -v /var/lib/containers/storage:/var/lib/containers/storage \
    -v $(pwd)/config.toml:/config.toml \
    -v $(pwd)/output:/output \
    quay.io/centos-bootc/bootc-image-builder:latest \
    --type raw \
    --rootfs btrfs \
    --use-librepo=True \
    ghcr.io/lauritskarl/fedora-bootc-server:latest
