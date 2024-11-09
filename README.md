# bonito

bonito is a collection of [Universal Blue](https://github.com/ublue-os) OCI images personalized for my machines.

The following variants are built daily:

* bonito-sway (base: [ublue-os/sericea-main](https://github.com/ublue-os/main/pkgs/container/sericea-main))

## Changes from base images

* Adds:
  * `foot`, `fzf`, `ripgrep` packages
  * `com.brave.Browser`, `com.github.tchx84.Flatseal`, `com.obsproject.Studio`, `com.valvesoftware.Steam`, `io.mpv.Mpv`, `org.audacityteam.Audacity`, `org.gimp.GIMP`, `org.gnome.Loupe`, `org.kde.kdenlive` via the user-invoked `install-flatpaks` script
  * [Hack font](https://github.com/source-foundry/Hack)
  * suspend on power button short press, poweroff on long press
  * Framework Laptop firmware and kernel modules
  * public key and configurations required to verify these signed images
