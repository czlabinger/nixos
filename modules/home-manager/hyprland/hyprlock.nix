{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {

      general = {
        disable_loading_bar = false;
        hide_cursor = true;
      };

      background = [
        {
          #Broken again
          #path = "screenshot";
          path = "/home/stoffi05/Pictures/lucy.jpg";
          blur_passes = 4;
          blur_size = 4;
          contrast = 1.2;
          brightness = 1.0;
          vibrancy = 1.0;
        }
      ];

      input-field = [
        {
          size = "250, 50";
          outline_thickness = 3;
          dots_center = true;
          outer_color = "rgba(a08c8955)";
          inner_color = "rgba(130F0F11)";
          font_color = "rgba(d8c2bfFF)";
          fade_on_empty = false;
          dots_spacing = 0.3;
          placeholder_text = "";
          hide_input = false;
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          # Clock
          monitor = "";
          text = ''cmd[update:100] echo "<b>$(date +'%T')</b>"'';
          position = "0, 300";
          font_family = "JetBrainsMono";
          font_size = 20;
          color = "rgba(ede0deFF)";
          halign = "center";
          valign = "center";
        }
        {
          # Greeting
          monitor = "";
          text = ''hi $USER'';
          position = "0, 240";
          font_family = "JetBrainsMono";
          font_size = 20;
          color = "rgba(ede0deFF)";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
