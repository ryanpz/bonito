ARG UBLUE_VARIANT=sericea-main
ARG BASE_IMAGE=ghcr.io/ublue-os/${UBLUE_VARIANT}
ARG FEDORA_MAJOR_VERSION=41

FROM scratch AS ctx
COPY ./ /

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG UBLUE_VARIANT
ARG FEDORA_MAJOR_VERSION

# contains framework kernel modules
COPY --from=ghcr.io/ublue-os/akmods:main-${FEDORA_MAJOR_VERSION} /rpms/ /tmp/rpms
RUN find /tmp/rpms

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh  && \
    ostree container commit
