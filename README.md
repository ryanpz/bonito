# fedora-atomic-images

My customized versions of the official Fedora Atomic Desktop OCI images

## Changes from stock images

* Adds `podman-compose`, `wl-clipboard`, and `mbpfan`
* Removes `firefox` and environment-specific automatic update systems
* Enables automatic weekly system updates via `rpm-ostreed`
* Adds and enables services that update flatpaks weekly
