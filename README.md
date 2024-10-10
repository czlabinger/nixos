# NixOS config

<div align="center">

![](https://img.shields.io/github/last-commit/czlabinger/nixos?&style=for-the-badge&color=FFB1C8&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/stars/czlabinger/nixos?style=for-the-badge&logo=andela&color=FFB686&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/github/repo-size/czlabinger/nixos?color=CAC992&label=SIZE&logo=googledrive&style=for-the-badge&logoColor=D9E0EE&labelColor=292324)
![](https://img.shields.io/badge/issues-skill-green?style=for-the-badge&color=CCE8E9&logoColor=D9E0EE&labelColor=292324)
</a>

</div>

## My NixOS config

I'm new to NixOS so please if you have any recommendations or something I can improve open a PR/Issue.

Neofetch uses ab absolute image path! Make sure you change it!

* **WM**: Hyprland <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/hyprland.svg" alt="Hyprland" style="max-width: 16px; max-height: 16px;">
* **OS**: NixOS <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/nixos.svg" alt="NixOs" style="max-width: 16px; max-height: 16px;">
* **Shell**: Zsh/Starship <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/zsh.svg" alt="Zsh" style="max-width: 16px; max-height: 16px;">
* **Terminal**: kitty <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/kitty.svg" alt="Kitty" style="max-width: 16px; max-height: 16px;">
* **Panel**: HyprPanel <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/hyprland.svg" alt="Hyprpanel" style="max-width: 16px; max-height: 16px;">
* **Notify Daemon**: Dunst
* **Launcher**: Wofi
* **File Manager**: Thunar <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/thunar.svg" alt="Thunar" style="max-width: 16px; max-height: 16px;">
* **IDE**: Neovim/Codium <img src="https://raw.githubusercontent.com/czlabinger/nixos/main/assets/Icons/neovim.svg" alt="Neovim" style="max-width: 16px; max-height: 16px;">

## Showcase

### Desktop
![desktop](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/1.png)
![tree](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/4.png)

### Neovim
![neovim](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/3.png)

### Launcher
![launcher](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/2.png)

### Firefox
![firefox](https://raw.githubusercontent.com/czlabinger/nixos/main/assets/5.png)

## Hosts

* WKS012-NixOS
    * My Laptop I mainly use for school stuff. Nvidia configured for 3050 Mobile.
* matthiasLaptop
    * Laptop of [@mkurz-TGM](https://www.github.com/mkurz-TGM). Nearly the same as WKS012-NixOS just some small changes. 
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

For Firefox start page to work open firefox and activate the 'New Tab Override' extention. Open the settings via Shift+F12 select local file and select '/path/to/nixos/modules/home-manager/firefox/firefox-new-tab.html'

## Thanks to
- [vimjoyer](https://www.youtube.com/@vimjoyer) for their videos
- [sukhmancs](https://github.com/sukhmancs/nixos-configs) for the iso generation workfolow
