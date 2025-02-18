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
    ../../modules/home-manager/common/cachix.nix
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



/*
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Firefly";
    size = 24;

    package = pkgs.runCommand "install-firefly" {} ''
      mkdir -p $out/share/icons/Firefly
      ${pkgs.fetchurl {
        url = "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1732277116/Firefly.tar.gz?response-content-disposition=attachment%3B%2520Firefly.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20250114%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250114T090008Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Signature=8576f7c8a1fc65444a10cb8b6ef60707626bc92e86e79f2c3026a9d8113b59d4";
        sha256 = "sha256-e8J0oPb83iT5GgqXaey+VSLOJtq2noWAtJXrD6S88Is=";
        name = "$out/Firefly.tar.gz";
      }}
      echo $pwd
      echo $(ls -la)
      chmod 777 $out/firefly.tar.gz
      tar xf firefly.tar.gz -C $out/share/icons/Firefly 
      chmod -R u+rwx $out/share/icons/Firefly
      chown -R root:root $out/share/icons/Firefly
    '';
  };

*/

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
