{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-gnome.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    disko
    parted
    git
    kitty
    foot
    zsh
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.xserver.enable = true;
  programs.hyprland.enable = true;
}
