{
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.xserver.enable = true;
  programs.hyprland.enable = true;
}
