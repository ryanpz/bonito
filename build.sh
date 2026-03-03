#!/bin/sh

set -eu

mkdir -p /etc/containers/registries.d \
	/etc/pki/containers

cp -r /ctx/files/system/etc/* /etc
cp -r /ctx/files/system/usr/* /usr
cp /ctx/files/signing/policy.json /etc/containers/policy.json
cp /ctx/files/signing/registry-config.yaml /etc/containers/registries.d/ryanpz.yaml
cp /ctx/cosign.pub /etc/pki/containers/ryanpz.pub

systemctl enable bootc-fetch-apply-updates.timer
systemctl --global enable flatpak-system-update.timer

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
