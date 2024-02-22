ARG FEDORA_SPIN="${SOURCE_IMAGE:-silverblue}"
ARG BASE_IMAGE="quay.io/fedora/fedora-${FEDORA_SPIN}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG FEDORA_SPIN

COPY usr /usr

COPY build.sh /tmp/ry-p/
COPY packages.json /tmp/ry-p/

RUN /tmp/ry-p/build.sh
