{ config, pkgs, lib, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.hyprpanel.overlay
    inputs.zeditor.overlays.default
  ];
}
