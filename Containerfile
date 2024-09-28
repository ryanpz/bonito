ARG FEDORA_ATOMIC_SPIN=silverblue
ARG BASE_IMAGE=quay.io/fedora-ostree-desktops/{FEDORA_ATOMIC_SPIN}
ARG FEDORA_MAJOR_VERSION=39

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG FEDORA_ATOMIC_SPIN

COPY usr /usr
COPY cosign.pub /usr/etc/pki/containers/ryanpz.pub

COPY build.sh packages.json /tmp/ryanpz/

RUN /tmp/ryanpz/build.sh && \
    rpm-ostree cleanup -m && \
    ostree container commit
