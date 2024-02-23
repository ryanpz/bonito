ARG FEDORA_SPIN=silverblue
ARG BASE_IMAGE=quay.io/fedora/fedora-${FEDORA_SPIN}
ARG FEDORA_MAJOR_VERSION=39

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG FEDORA_SPIN

COPY usr /usr
COPY cosign.pub /usr/etc/pki/containers/ry-p.pub

COPY build.sh packages.json /tmp/ry-p/

RUN /tmp/ry-p/build.sh && \
    rpm-ostree cleanup -m && \
    ostree container commit
