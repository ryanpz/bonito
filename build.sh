#!/bin/sh

set -eu

mkdir -p /etc/containers/registries.d \
	/etc/pki/containers

cp -r /ctx/files/system/etc/* /etc
cp -r /ctx/files/system/usr/* /usr
cp /ctx/files/signing/policy.json /etc/containers/policy.json
cp /ctx/files/signing/registry-config.yaml /etc/containers/registries.d/ryanpz.yaml
cp /ctx/cosign.pub /etc/pki/containers/ryanpz.pub

jq_args="-r '.all.{{X}}[], .\"$SOURCE_IMAGE_NAME\".{{X}}[]' /ctx/packages.json"
package_list() {
	echo "$jq_args" | sed "s/{{X}}/$1/g" | xargs jq
}

exclude_list=$(package_list 'exclude')
include_list=$(package_list 'include')

# shellcheck disable=SC2086
[ -n "$exclude_list" ] && dnf5 remove -y $exclude_list
# shellcheck disable=SC2086
[ -n "$include_list" ] && dnf5 install -y $include_list

systemctl enable bootc-fetch-apply-updates.timer
systemctl enable flatpak-system-update.timer
systemctl --global enable flatpak-user-update.timer

# framework firmware
# from https://github.com/ublue-os/bluefin/blob/f833e1f6a5d1863b26e6f24a5ec28068d511b3de/build_files/base/08-firmware.sh
mkdir -p /tmp/mediatek-firmware
curl -Lo /tmp/mediatek-firmware/WIFI_MT7922_patch_mcu_1_1_hdr.bin https://gitlab.com/kernel-firmware/linux-firmware/-/raw/8f08053b2a7474e210b03dbc2b4ba59afbe98802/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin?inline=false
curl -Lo /tmp/mediatek-firmware/WIFI_RAM_CODE_MT7922_1.bin https://gitlab.com/kernel-firmware/linux-firmware/-/raw/8f08053b2a7474e210b03dbc2b4ba59afbe98802/mediatek/WIFI_RAM_CODE_MT7922_1.bin?inline=false
xz --check=crc32 /tmp/mediatek-firmware/WIFI_MT7922_patch_mcu_1_1_hdr.bin
xz --check=crc32 /tmp/mediatek-firmware/WIFI_RAM_CODE_MT7922_1.bin
mv -vf /tmp/mediatek-firmware/* /usr/lib/firmware/mediatek/
rm -rf /tmp/mediatek-firmware

# cleanup
rm -rfv /tmp/*
rm -rfv /usr/etc
# shellcheck disable=SC2115
rm -rfv /boot/*

for d in /var/*; do
	if [ "$d" != '/var/cache' ]; then
		rm -rfv "${d:?}"/*
	fi
done

for d in /var/cache/*; do
	if [ "$d" != '/var/cache/libdnf5' ]; then
		rm -rfv "${d:?}"/*
	fi
done
