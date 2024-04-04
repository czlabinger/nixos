# NixOS config

<div align="center">

![](https://img.shields.io/github/last-commit/czlabinger/nixos?&style=for-the-badge&color=FFB1C8&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/stars/czlabinger/nixos?style=for-the-badge&logo=andela&color=FFB686&logoColor=D9E0EE&labelColor=292324)
[![](https://img.shields.io/github/repo-size/czlabinger/nixos?color=CAC992&label=SIZE&logo=googledrive&style=for-the-badge&logoColor=D9E0EE&labelColor=292324)](https://github.com/czlabinger/nixos)
![](https://img.shields.io/badge/issues-skill-green?style=for-the-badge&color=CCE8E9&logoColor=D9E0EE&labelColor=292324)
</a>

</div>

## My NixOS config

I'm new to NixOS so please if you have any recommendations or something I can improve open a PR/Issue.

Neofetch and hyprlock use absolute image paths! Make sure you change them!

## Showcase

### Desktop
![desktop](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/1.png)

### Neovim
![neovim](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/2.png)

### Launcher
![launcher](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/3.png)


## Hosts

* WKS012-NixOS
    * My Laptop I mainly use for school stuff.
* ISO
    * Used to generate an ISO image with the stuff I need to do basic work.
* WKS011-NixOS
    * TODO: Will be my PC setup if I get around to do it.

## Installation

```bash
git clone git@github.com:czlabinger/nixos.git && cd nixos
cp /etc/nixos/hardware-configuration.nix ./hosts/WKS012-NixOS/
sudo nixos-rebuild --flake .#WKS012-NixOS switch
```

## Thanks to
- [vimjoyer](https://www.youtube.com/@vimjoyer) for their videos
- [nomadics9](https://github.com/nomadics9/NixOS-Flake) for their waybar config
