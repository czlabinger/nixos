{ pkgs, ... }: {
  home.file = {
    ".config/neofetch/nixos.png".source = ./nixos.png;

    ".config/neofetch/config.conf".text = ''
      image_backend="kitty"
      image_source="${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg"
      image_size="270px"
    '';
  };
}
