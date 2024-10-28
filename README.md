# fedora-atomic

My customized Fedora Atomic Desktop OCI images

Images based on the following atomic spins are built daily:
* Kinoite ([base images](https://quay.io/repository/fedora-ostree-desktops/kinoite))
* Sway Atomic ([base images](https://quay.io/repository/fedora-ostree-desktops/sway-atomic))
* Cosmic Atomic ([base images](https://quay.io/repository/fedora-ostree-desktops/cosmic-atomic))

## Changes from base images

* Adds:
  *  `distrobox`, `foot`, `fzf`, `mbpfan`, `ripgrep`
  *  automatic daily system updates via `rpm-ostreed`
  *  automatic daily flatpak updates
  *  public key and configurations required to verify these signed images
* Removes:
  *  `firefox`
  *  desktop-specific automatic update systems
