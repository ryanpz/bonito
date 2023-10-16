# fedora-oci-images

My (very experimental) OCI images derived from Fedora's image-based desktops

## Changes from stock images

* Adds `podman-compose` and `wl-clipboard`
* Removes `firefox` and environment-specific automatic update systems
* Enables automatic weekly system updates via `rpm-ostreed`
* Adds service that updates user-installed flatpaks weekly (must be enabled manually)
