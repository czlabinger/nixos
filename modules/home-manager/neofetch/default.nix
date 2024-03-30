{...}: {
  home.file = {
    ".config/neofetch/nixos.png".source = ./nixos.png;

    ".config/neofetch/config.conf".text = ''
      image_backend="kitty"
      image_source="/home/stoffi05/Pictures/nixos.png"
      image_size="270px"
    '';
  };
}
