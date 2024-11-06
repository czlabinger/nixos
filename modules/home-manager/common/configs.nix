{pkgs, ...}: {
 home.file = {
    ".jdk".source = pkgs.jdk21;

    ".python".source = pkgs.python3;

    ".config/hypr/scripts/wofi_helper.sh" = {
      text = ''

        #!/usr/bin/env bash

        if pgrep -x "wofi" > /dev/null
        then
          pkill wofi
        else
          wofi &
        fi

      '';
      executable = true;
    };

    ".config/hyprswitch/hyprswitch.css" = {
        text = builtins.readFile ../hyprswitch/hyprswitch.css;
    };

    ".config/lsd/icons.yml" = {
      text = ''
        name:
          nixos: 
      '';
    };

  };

}
