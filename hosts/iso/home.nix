{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/zsh
    ../../modules/home-manager/starship
    ../../modules/home-manager/wofi
    ../../modules/home-manager/kitty
    ../../modules/home-manager/firefox
  ];

  home.stateversion = "23.11"; # don't edit!

  home.username = "nixos";
  home.homedirectory = "/home/nixos";

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
    
  programs.home-manager.enable = true;
}
