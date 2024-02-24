# fedora-atomic-images

My customized versions of the official Fedora Atomic Desktop OCI images

## Changes from base images

* Adds `podman-compose`, `wl-clipboard`, and `mbpfan`
* Removes `firefox` and desktop-specific automatic update systems
* Enables automatic weekly system updates via `rpm-ostreed`
* Adds and enables services that update flatpaks weekly
* Adds the public key and configurations required to verify these signed images
