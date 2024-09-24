{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lockCmd = "hyrplock";
        ignoreDbusInhibit = false;
        beforeSleepCmd = "hyprlock";
      };

      listener = [
        {
          timeout = 3 * 60;
          onTimeout = "hyprlock";
        }
        {
          timeout = 8 * 60;
          onTimeout = "${pkgs.coreutils}/bin/sleep 1 && systemctl suspend";
          onResume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
