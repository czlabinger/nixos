{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
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
  services.xserver.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
}
