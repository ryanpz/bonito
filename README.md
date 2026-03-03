# bonito

bonito is a collection of [Fedora Atomic Desktop](https://fedoraproject.org/atomic-desktops) OCI images personalized for my machines.

The following variants are built daily:

* bonito-sway (base: [sway-atomic](https://quay.io/repository/fedora-ostree-desktops/sway-atomic))
* bonito-kde (base: [kinoite](https://quay.io/repository/fedora-ostree-desktops/kinoite))

## Changes from base images

* Adds:
  * automatic system and flatpak updates
  * public key and configurations required to verify these signed images
