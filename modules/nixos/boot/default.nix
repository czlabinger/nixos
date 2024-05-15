{...}: {
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      grub = {
        enable = true;
        efiSupport = true;
        #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
        device = "nodev";
      };
    };

    tmp.cleanOnBoot = true;
  };
}
