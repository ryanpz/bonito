#!/bin/sh

set -eu

mkdir -p /usr/etc/containers \
    /etc/containers/registries.d \
    /etc/pki/containers

cp -r /ctx/files/system/etc/* /etc
cp -r /ctx/files/system/usr/* /usr
cp /ctx/files/signing/policy.json /usr/etc/containers/policy.json
cp /ctx/files/signing/registry-config.yaml /etc/containers/registries.d/ryanpz.yaml
cp /ctx/cosign.pub /etc/pki/containers/ryanpz.pub

jq_args="-r '.all.{{X}}[], .\"$SOURCE_IMAGE_NAME\".{{X}}[]' /ctx/packages.json"
package_list() {
    echo "$jq_args" | sed "s/{{X}}/$1/g" | xargs jq
}

exclude_list=$(package_list 'exclude')
include_list=$(package_list 'include')

# shellcheck disable=SC2086
[ -n "$exclude_list" ] && rpm-ostree override remove $exclude_list
# shellcheck disable=SC2086
[ -n "$include_list" ] && rpm-ostree install $include_list

# Hack font
mkdir -p /tmp/hack-font
curl -Lo /tmp/hack-font/hack.tar.gz https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz
tar -xvzf /tmp/hack-font/hack.tar.gz -C /tmp/hack-font
mv -v /tmp/hack-font/ttf /usr/share/fonts/hack
chown -R root:root /usr/share/fonts/hack
fc-cache -f /usr/share/fonts/hack
rm -rf /tmp/hack-font

# framework kernel modules
rpm-ostree install /tmp/rpms/kmods/*framework-laptop*.rpm

# framework firmware
# from https://github.com/ublue-os/bluefin/blob/f833e1f6a5d1863b26e6f24a5ec28068d511b3de/build_files/base/08-firmware.sh
mkdir -p /tmp/mediatek-firmware
curl -Lo /tmp/mediatek-firmware/WIFI_MT7922_patch_mcu_1_1_hdr.bin https://gitlab.com/kernel-firmware/linux-firmware/-/raw/8f08053b2a7474e210b03dbc2b4ba59afbe98802/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin?inline=false
curl -Lo /tmp/mediatek-firmware/WIFI_RAM_CODE_MT7922_1.bin https://gitlab.com/kernel-firmware/linux-firmware/-/raw/8f08053b2a7474e210b03dbc2b4ba59afbe98802/mediatek/WIFI_RAM_CODE_MT7922_1.bin?inline=false
xz --check=crc32 /tmp/mediatek-firmware/WIFI_MT7922_patch_mcu_1_1_hdr.bin
xz --check=crc32 /tmp/mediatek-firmware/WIFI_RAM_CODE_MT7922_1.bin
mv -vf /tmp/mediatek-firmware/* /usr/lib/firmware/mediatek/
rm -rf /tmp/mediatek-firmware
