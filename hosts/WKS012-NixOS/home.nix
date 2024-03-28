{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/waybar
    ../../modules/home-manager/foot
    ../../modules/home-manager/oh-my-zsh
    ../../modules/home-manager/starship
    ../../modules/home-manager/wofi
    ../../modules/home-manager/neovim
  ];

  home.username = "stoffi05";
  home.homeDirectory = "/home/stoffi05";

  home.stateVersion = "23.11"; # Don't edit!

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "rebuild" ''
      #!/usr/bin/env bash
      export NIX_PATH=$NIX_PATH:nixos-config=/home/stoffi05/nixos/hosts/WKS012-NixOS/
      set -e

      pushd ~/nixos
      alejandra . >/dev/null

      git diff -U0 *.nix

      echo "NixOS rebuilding"

      sudo nixos-rebuild switch --flake . &>~/nixos-switch.log || (cat ~/nixos-switch.log | grep --color error && false)

      current=$(nixos-rebuild list-generations | grep current)

      git commit -am "$current"

      popd
    '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.text
  home.file = {
    ".jdk".source = pkgs.jdk21;

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
