# bonito

bonito is a collection of [Universal Blue](https://github.com/ublue-os) OCI images personalized for my machines.

The following variants are built daily:

* bonito-sway (base: [ublue-os/sericea-main](https://github.com/ublue-os/main/pkgs/container/sericea-main))

## Changes from base images

* Adds:
  * `foot`, `fzf`, `ripgrep` packages
  * suspend on power button short press, poweroff on long press
  * Framework Laptop firmware and kernel modules
  * public key and configurations required to verify these signed images
