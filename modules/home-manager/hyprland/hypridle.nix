{pkgs, ...}: {
  services.hypridle = {
    enable = true;
    settings = {
      lockCmd = "hyrplock";
      ignoreDbusInhibit = false;
      beforeSleepCmd = "hyprlock";

      listeners = [
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
