# fedora-atomic-images

My customized Fedora Atomic Desktop OCI images

Images based on the following atomic spins are built daily:
* Silverblue ([base images](https://quay.io/repository/fedora-ostree-desktops/silverblue))
* Sway Atomic ([base images](https://quay.io/repository/fedora-ostree-desktops/sericea))

## Changes from base images

* Adds:
  *  `distrobox`, `foot`, `fzf`, `mbpfan`, `ripgrep`
  *  automatic daily system updates via `rpm-ostreed`
  *  automatic daily flatpak updates
  *  public key and configurations required to verify these signed images
* Removes:
  *  `firefox`
  *  desktop-specific automatic update systems
