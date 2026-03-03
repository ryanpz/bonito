ARG SOURCE_IMAGE_REGISTRY=quay.io/fedora-ostree-desktops
ARG SOURCE_IMAGE_NAME=sway-atomic
ARG SOURCE_IMAGE_TAG=41
ARG SOURCE_IMAGE_REFERENCE=${SOURCE_IMAGE_REGISTRY}/${SOURCE_IMAGE_NAME}:${SOURCE_IMAGE_TAG}

FROM scratch AS ctx
COPY ./ /

FROM ${SOURCE_IMAGE_REFERENCE}

RUN mkdir /nix

ARG SOURCE_IMAGE_NAME

RUN --mount=type=bind,from=ctx,src=/,dst=/ctx \
    --mount=type=cache,target=/var/cache \
    --mount=type=cache,target=/var/log \
    --mount=type=tmpfs,target=/tmp \
    /ctx/build.sh  && \
    ostree container commit

RUN ["bootc", "container", "lint"]
