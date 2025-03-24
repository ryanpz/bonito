ARG SOURCE_IMAGE_REGISTRY=quay.io/fedora-ostree-desktops
ARG SOURCE_IMAGE_NAME=sway-atomic
ARG SOURCE_IMAGE_TAG=41
ARG SOURCE_IMAGE_REFERENCE=${SOURCE_IMAGE_REGISTRY}/${SOURCE_IMAGE_NAME}:${SOURCE_IMAGE_TAG}

FROM scratch AS ctx
COPY ./ /

FROM ${SOURCE_IMAGE_REFERENCE}

ARG SOURCE_IMAGE_NAME

RUN --mount=type=cache,dst=/var/cache/libdnf5 \
    --mount=type=bind,from=ctx,src=/,dst=/ctx \
    /ctx/build.sh  && \
    bootc container lint && \
    ostree container commit
