{pkgs, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        shell = "zsh";
        font = "SpaceMono Nerd Font:size=11";
      };
      colors = {
        alpha = 0.5;
      };

      cursor = {
        style = "beam";
        blink = "no";
        beam-thickness = "1.5";
      };
    };
  };
}
