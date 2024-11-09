ARG FEDORA_ATOMIC_SPIN=sway-atomic
ARG BASE_IMAGE=quay.io/fedora-ostree-desktops/${FEDORA_ATOMIC_SPIN}
ARG FEDORA_MAJOR_VERSION=39

FROM scratch AS ctx
COPY ./ /

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG FEDORA_ATOMIC_SPIN

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh  && \
    ostree container commit
