{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
      image_size = 32;
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
        border-bottom: 3px solid white;
      }

      #entry {
        padding: 0.25em;
      }

      #entry:selected {
        background-color: #bbccdd;
        background: linear-gradient(90deg, #bbffdd, #dd77ff);
      }

      #text:selected {
        color: #333333;
      }

      #input {
        background-color: rgba(50, 50, 50, 0.5);
        color: white;
        padding: 0.25em;
      }

      image {
        margin-left: .25em;
        margin-right: .25em;
      }

    '';
  };
}
