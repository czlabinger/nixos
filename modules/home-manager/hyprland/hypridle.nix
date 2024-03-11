{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];
  services.hypridle = {
    enable = true;
    lockCmd = "hyprlock";
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
}
