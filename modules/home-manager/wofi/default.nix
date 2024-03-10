{pkgs, ...}: {
  programs.wofi = {
    enable = true;
    settings = {
    };

    style = ''
      * {
        border-radius: 3px;
        border: none;
      }

      window {
        font-size: 32px;
        font-family: "Roboto Mono Medium";
        background-color: rgba(50, 50, 50, 0.9);
        color: white;
      }

      #entry {
        padding: 0.25em;
      }

      #entry:selected {
        background-color: #bbccdd;
        background: linear-gradient(90deg, #bbccdd, #cca5dd);
      }

      #text:selected {
        color: #333333;
      }

      #input {
        background-color: rgba(50, 50, 50, 0.5);
        color: white;
        padding: 0.25em;
      }
    '';
  };
}
