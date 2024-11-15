
## For UBLUE --->

[] GDM theming: 
    - https://github.com/DimaZirix/fedora-gdm-wallpaper
    - Check ublue patterns

[] Move the following out of config and into base image

```text
# System Icons and Themes
system_themes:
  - adw-gtk3-theme
  - pop-gtk2-theme
  - pop-gtk3-theme
  - pop-gtk4-theme

system_icons:
  - papirus-icon-theme
  - papirus-icon-theme-dark
  - numix-icon-theme
  - numix-icon-theme-square
```
[] Move relevant custom JUST tasks out of this repo

### Themeing
# GTK and Desktop Settings
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Breeze"
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface font-name "Sans 11"
gsettings set org.gnome.desktop.interface scaling-factor 2


different workspace icons for desktop/laptop. 
fix tailscale on laptop run, include trayscale flatpak with install flatpak install flathub dev.deedles.Trayscale
