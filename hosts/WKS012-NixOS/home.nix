{pkgs, ...}: {
  imports = [
    ../../modules/home-manager/hyprland/hyprland-czlabinger.nix
    ../../modules/home-manager/foot
    ../../modules/home-manager/zsh
    ../../modules/home-manager/starship
    ../../modules/home-manager/wofi
    ../../modules/home-manager/neovim
    ../../modules/home-manager/kitty
    ../../modules/home-manager/neofetch
    ../../modules/home-manager/firefox
    ../../modules/home-manager/qt
    ../../modules/home-manager/common/configs.nix
    #../../modules/home-manager/ags
    #../../modules/home-manager/waybar
  ];

  home.username = "stoffi05";
  home.homeDirectory = "/home/stoffi05";

  home.stateVersion = "23.11"; # Don't edit!

  home.packages = with pkgs; [
    (writeShellScriptBin "google-chrome" ''
      google-chrome-stable "$@"
    '')
  ];

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

  xdg.desktopEntries = {
    element = {
      name = "Element";
      genericName = "Chat";
      exec = "element-desktop";
      terminal = false;
      icon = ./element-icon.png;
    };
  };

  programs.home-manager.enable = true;
}
