#!/bin/sh

set -eu

mkdir -p /usr/etc/containers \
    /etc/containers/registries.d \
    /etc/pki/containers

cp -r /ctx/files/system/etc/* /etc
cp /ctx/files/signing/policy.json /usr/etc/containers/policy.json
cp /ctx/files/signing/registry-config.yaml /etc/containers/registries.d/ryanpz.yaml
cp /ctx/cosign.pub /etc/pki/containers/ryanpz.pub

jq_args="-r '.all.{{X}}[], .\"$UBLUE_VARIANT\".{{X}}[]' /ctx/packages.json"
package_list() {
    echo "$jq_args" | sed "s/{{X}}/$1/g" | xargs jq
}

exclude_list=$(package_list 'exclude')
include_list=$(package_list 'include')

# shellcheck disable=SC2086
[ -n "$exclude_list" ] && rpm-ostree override remove $exclude_list
# shellcheck disable=SC2086
[ -n "$include_list" ] && rpm-ostree install $include_list
