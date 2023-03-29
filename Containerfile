FROM quay.io/fedora-ostree-desktops/sericea:38

COPY etc /etc
COPY usr /usr

RUN rpm-ostree override remove firefox firefox-langpacks && \
    rpm-ostree install podman-compose && \
    systemctl enable bootc-upgrade.timer && \
    rpm-ostree cleanup -m && \
    ostree container commit
