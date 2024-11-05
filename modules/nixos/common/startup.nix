{...}: {

  system.userActivationScripts = {
    hyprlandTmp = {
      text =''
        ln -s /run/user/1000/hypr /tmp/hypr
      '';
      deps = [];
    };
  };
}
