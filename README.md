# fedora-oci-images

My (very experimental) OCI images derived from Fedora's image-based desktops

## Changes from stock images

* Adds `podman-compose`, `wl-clipboard`, and `mbpfan`
* Removes `firefox` and environment-specific automatic update systems
* Enables automatic weekly system updates via `rpm-ostreed`
* Adds and enables services that update flatpaks weekly
