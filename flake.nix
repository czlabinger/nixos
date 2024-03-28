{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    hyprcursor.url = "github:hyprwm/hyprcursor";
    waybar.url = "github:Alexays/Waybar";
    guifetch.url = "github:FlafyDev/guifetch";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    hyprcursor,
    waybar,
    guifetch,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.guifetch = guifetch.packages.${system}.default;
    nixosConfigurations.WKS012-NixOS = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/WKS012-NixOS/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.ISO = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/iso/configuration.nix
      ];
    };
  };
}
