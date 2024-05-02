{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/waybar/matthias.nix
    ../../modules/home-manager/foot
    ../../modules/home-manager/zsh
    ../../modules/home-manager/starship
    ../../modules/home-manager/wofi
    ../../modules/home-manager/neovim
    ../../modules/home-manager/kitty
    ../../modules/home-manager/neofetch
    ../../modules/home-manager/firefox
  ];

  home.username = "matthias";
  home.homeDirectory = "/home/matthias";

  home.stateVersion = "23.11"; # Don't edit!

  home.file = {
    ".jdk".source = pkgs.jdk21;
    
    ".python".source = pkgs.python3;

    ".config/hypr/scripts/wofi_helper.sh" = {
      text = ''

        #!/usr/bin/env bash

        if pgrep -x "wofi" > /dev/null
        then
          pkill wofi
        else
          wofi &
        fi

      '';
      executable = true;
    };
  };

  gtk = {
    enable = true;
    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Original-Classic";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3-dark";

    iconTheme.package = pkgs.qogir-icon-theme;
    iconTheme.name = "Qogir";
  };

  # 'home.sessionVariables'. # Change env variables

  programs.home-manager.enable = true;
}
