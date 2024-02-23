#!/bin/sh

set -eu

jq_args="-r '.all.{{X}}[], .$FEDORA_SPIN.{{X}}[]' /tmp/ry-p/packages.json"
package_list() {
    echo "$jq_args" | sed "s/{{X}}/$1/g" | xargs jq
}

exclude_list=$(package_list 'exclude')
include_list=$(package_list 'include')

# shellcheck disable=SC2086
rpm-ostree override remove $exclude_list
# shellcheck disable=SC2086
rpm-ostree install $include_list
systemctl enable rpm-ostreed-automatic.timer
systemctl enable flatpak-system-update.timer
systemctl --global enable flatpak-user-update.timer
