{
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"
    ./../../modules/nixos/overlays
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
