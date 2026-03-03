# bonito

bonito is a collection of [Fedora Atomic Desktop](https://fedoraproject.org/atomic-desktops) OCI images personalized for my machines.

The following variants are built daily:

* bonito-sway (base: [sway-atomic](https://quay.io/repository/fedora-ostree-desktops/sway-atomic))
* bonito-kde (base: [kinoite](https://quay.io/repository/fedora-ostree-desktops/kinoite))

## Changes from base images

* Adds:
  * `distrobox`, `foot`, `fzf`, `power-profiles-daemon`, `ripgrep`, `source-foundry-hack-fonts`, `wl-clipboard` packages
  * `com.github.tchx84.Flatseal`, `com.obsproject.Studio`, `com.valvesoftware.Steam`, `io.mpv.Mpv`, `org.audacityteam.Audacity`, `org.gimp.GIMP`, `org.gnome.Loupe`, `org.kde.kdenlive`, `org.mozilla.firefox`, `org.signal.Signal` flatpaks via the user-invoked `install-flatpaks` script
  * suspend on power button short press, poweroff on long press
  * Framework Laptop firmware
  * public key and configurations required to verify these signed images

* Removes:
  *  `firefox`, `tuned-ppd` packages
  *  desktop-specific automatic update systems
