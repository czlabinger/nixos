{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "hyrplock";
        ignore_dbus_inhibit = false;
        before_sleep_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 3 * 60;
          on-timeout = "hyprlock";
        }
        {
          timeout = 8 * 60;
          on-timeout = "${pkgs.coreutils}/bin/sleep 1 && systemctl suspend";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
