{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/common/packages.nix
    ./../../modules/nixos/common/startup.nix
    ./../../modules/nixos/boot
    ./../../modules/nixos/nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    
    kernelParams = [
      "intel_iommu=on"
      "iommu=pt"
      "vfio-pci.ids=10de:2489,10de:228b"
    ];
  };

  swapDevices = [{
    device = "/swapfile";
    size = 32 * 1024; # 32GB
  }];

  security.pam.services.hyprlock.text = "auth include login";

  networking = {
    hostName = "WKS012-NixOS";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Vienna";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  hardware.bluetooth.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [mesa];
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [mesa];
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";

      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.libinput.enable = true;

  users.users.stoffi05 = {
    isNormalUser = true;
    description = "Stoffi05";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "video" "docker" "libvirtd" "input"];
  };

  users.extraGroups.docker.members = ["username-with-access-to-socket"];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "stoffi05" = import ./home.nix;
    };
  };
  nix.settings.trusted-users = [ "root" "stoffi05" "nixremote" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    go


    # Browsers
    google-chrome

    # Communication
    arrpc
    webcord-vencord
    element-desktop

    # Development
    alejandra
    cargo
    cudaPackages.cudatoolkit
    dart
    flutter
    git-lfs
    rust-analyzer
    rustup
    vimPlugins.flutter-tools-nvim

    # Miscellaneous
    anki-bin
    #cava
    fzf
    gnome-multi-writer
    ydotool
    zip
    cbonsai

    # Programming Tools
    dart
    flutter

    # Utilities
    appimage-run
    baobab
    fceux
    hollywood
    imagemagick
    libnvidia-container
    lsd
    nvidia-container-toolkit
    nvidia-docker
    steam
    tidal-hifi
    virt-manager
    virtio-win
    virtiofsd
    llvmPackages_17.clang
    pacman
    protontricks
    wine

    # Switch dev
    ryujinx
  ];

  environment.interactiveShellInit = ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export CMAKE_C_COMPILER=${pkgs.libgcc}/
    export CMAKE_CXX_COMPILER=${pkgs.libgcc}/
    export NIXOS_OZONE_WL=1

    export QT_QUICK_CONTROLS_STYLE=org.hyprland.style
    
    alias nvim='neovide $1 --fork'
    alias tree='lsd --tree'
    alias ls='lsd $1'
    alias zed='DRI_PRIME=1 zeditor'
    alias zeditor='DRI_PRIME=1 zeditor'
  '';

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  fonts.packages = with pkgs; [
    material-icons
    roboto-mono
    font-awesome
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.space-mono
  ];

  environment.etc = with pkgs; {
    "openjdk21".source = jdk21;
    "makepkg.conf".source = "${pacman}/etc/makepkg.conf";
  };

  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    virtualbox.host.enable = true;
  };

  system.stateVersion = "23.11"; # Don't edit!

  programs.light.enable = true;
  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.dbus.packages = with pkgs; [
    xfce.xfconf
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8080 ];
    allowedUDPPorts = [ 8080 ];
  };

  environment.sessionVariables = {
    FLAKE = "/home/stoffi05/nixos";
  };
}
