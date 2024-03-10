{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
    };

    style = ''
      window {
        font-size: 32px;
        font-family: "Roboto Mono Medium";
        background-color: rgba(50, 50, 50, 0.9);
        color: white;
      }

      #entry:selected {
        background-color: #bbccdd;
        color: #333333;
      }

      #text:selected {
        color: #333333;
      }

      #input {
        background-color: rgba(50, 50, 50, 0.5);
      }
    '';
  };
}
