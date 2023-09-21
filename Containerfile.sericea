FROM quay.io/fedora-ostree-desktops/sericea:38

COPY usr /usr

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install podman-compose && \
    systemctl enable rpm-ostreed-automatic.timer && \
    rpm-ostree cleanup -m && \
    ostree container commit
