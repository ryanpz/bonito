ARG SOURCE_IMAGE_NAME=sway-atomic
ARG SOURCE_IMAGE=quay.io/fedora-ostree-desktops/${SOURCE_IMAGE_NAME}
ARG SOURCE_IMAGE_TAG=41

FROM scratch AS ctx
COPY ./ /

FROM ${SOURCE_IMAGE}:${SOURCE_IMAGE_TAG}

ARG SOURCE_IMAGE_NAME

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh  && \
    ostree container commit
