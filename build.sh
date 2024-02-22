#!/bin/sh

set -eu

include_pkgs() {
    jq -r ".all.include[], .$FEDORA_SPIN.include[]" /tmp/ry-p/packages.json
}

exclude_pkgs() {
    jq -r ".all.exclude[], .$FEDORA_SPIN.exclude[]" /tmp/ry-p/packages.json
}

rpm-ostree override remove $(exclude_pkgs) && \
    rpm-ostree install $(include_pkgs) && \
    systemctl enable rpm-ostreed-automatic.timer && \
    rpm-ostree cleanup -m && \
    ostree container commit
