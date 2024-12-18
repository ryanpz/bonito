# bonito

bonito is a collection of [Fedora Atomic Desktop](https://fedoraproject.org/atomic-desktops) OCI images personalized for my machines.

The following variants are built daily:

* bonito-sway (base: [sway-atomic](https://quay.io/repository/fedora-ostree-desktops/sway-atomic))
* bonito-kde (base: [kinoite](https://quay.io/repository/fedora-ostree-desktops/kinoite))

## Changes from base images

* Adds:
  * `foot`, `fzf`, `power-profiles-daemon`, `ripgrep` packages
  * `com.brave.Browser`, `com.github.tchx84.Flatseal`, `com.obsproject.Studio`, `com.valvesoftware.Steam`, `io.mpv.Mpv`, `org.audacityteam.Audacity`, `org.gimp.GIMP`, `org.gnome.Loupe`, `org.kde.kdenlive`, `org.signal.Signal` flatpaks via the user-invoked `install-flatpaks` script
  * [Hack font](https://github.com/source-foundry/Hack)
  * suspend on power button short press, poweroff on long press
  * Framework Laptop firmware
  * public key and configurations required to verify these signed images

* Removes:
  *  `firefox`, `tuned-ppd` packages
  *  desktop-specific automatic update systems
