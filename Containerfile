ARG SOURCE_IMAGE_NAME=sericea-main
ARG SOURCE_IMAGE=ghcr.io/ublue-os/${SOURCE_IMAGE_NAME}
ARG SOURCE_IMAGE_TAG=41

FROM scratch AS ctx
COPY ./ /

FROM ${SOURCE_IMAGE}:${SOURCE_IMAGE_TAG}

ARG SOURCE_IMAGE_NAME
ARG SOURCE_IMAGE_TAG

# contains framework kernel modules
COPY --from=ghcr.io/ublue-os/akmods:main-${SOURCE_IMAGE_TAG} /rpms/ /tmp/rpms
RUN find /tmp/rpms

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh  && \
    ostree container commit
