# bonito

bonito is a collection of [Fedora Atomic Desktop](https://fedoraproject.org/atomic-desktops) OCI images personalized for my machines.

The following variants are built daily:

* bonito (base: [silverblue](https://quay.io/repository/fedora-ostree-desktops/silverblue))
* bonito-sway (base: [sway-atomic](https://quay.io/repository/fedora-ostree-desktops/sway-atomic))

## Changes from base images

* Adds:
  * automatic system and flatpak updates
  * public key and configurations required to verify these signed images
