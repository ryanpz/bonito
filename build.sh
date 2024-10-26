#!/bin/sh

set -eu

if [ ! -f "$1" ]; then
    printf 'error: packages_file %s does not exist\n' "$1"
    exit 1
fi

jq_args="-r '.all.{{X}}[], .\"$FEDORA_ATOMIC_SPIN\".{{X}}[]' $1"
package_list() {
    echo "$jq_args" | sed "s/{{X}}/$1/g" | xargs jq
}

exclude_list=$(package_list 'exclude')
include_list=$(package_list 'include')

# shellcheck disable=SC2086
[ -n "$exclude_list" ] && rpm-ostree override remove $exclude_list
# shellcheck disable=SC2086
[ -n "$include_list" ] && rpm-ostree install $include_list
systemctl enable rpm-ostreed-automatic.timer
systemctl enable flatpak-system-update.timer
systemctl --global enable flatpak-user-update.timer
