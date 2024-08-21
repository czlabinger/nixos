{ config, pkgs, lib, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
  ];
}
