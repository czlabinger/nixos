{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/foot
    ../../modules/home-manager/zsh
    ../../modules/home-manager/starship
    ../../modules/home-manager/wofi
    ../../modules/home-manager/neovim
    ../../modules/home-manager/kitty
    ../../modules/home-manager/neofetch
    ../../modules/home-manager/firefox
    #../../modules/home-manager/ags
    #../../modules/home-manager/waybar
  ];

  home.stateversion = "23.11"; # don't edit!

  home.username = "nixos";
  home.homedirectory = "/home/nixos";

  home.packages = with pkgs; [
    (writeshellscriptbin "google-chrome" ''
      google-chrome-stable "$@"
    '')
  ];

  home.file = {
    ".jdk".source = pkgs.jdk21;
    #".jdk17".source = pkgs.jdk17;

    ".python".source = pkgs.python3;

    ".config/hypr/scripts/wofi_helper.sh" = {
      text = ''

        #!/usr/bin/env bash

        if pgrep "wofi" > /dev/null
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
    cursortheme.package = pkgs.bibata-cursors;
    cursortheme.name = "bibata-original-classic";

    theme.package = pkgs.adw-gtk3;
    theme.name = "adw-gtk3-dark";

    icontheme.package = pkgs.qogir-icon-theme;
    icontheme.name = "qogir";
  };

  # 'home.sessionvariables'. # change env variables

  programs.home-manager.enable = true;
}
