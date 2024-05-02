{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprlock.url = "github:hyprwm/hyprlock";
    hypridle.url = "github:hyprwm/hypridle";
    hyprcursor.url = "github:hyprwm/hyprcursor";
    waybar.url = "github:Alexays/Waybar";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    ags.url = "github:Aylur/ags";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland,
    hyprlock,
    hypridle,
    hyprcursor,
    waybar,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.WKS012-NixOS = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/WKS012-NixOS/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.matthiasLaptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/matthiasLaptop/configuration.nix
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
