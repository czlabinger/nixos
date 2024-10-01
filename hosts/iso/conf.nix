{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./../../modules/nixos/nix
  ];

  security.pam.services.hyprlock.text = "auth include login";

  networking.hostName = "WKS012-NixOS-ISO";

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [mesa];
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [mesa];
  };

  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixos = {
    isNormalUser = true;
    description = "NixOS";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "video" "docker" "libvirtd" "input"];
  };

  users.extraGroups.docker.members = ["username-with-access-to-socket"];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  
    # Audio
    pulseaudio
    pavucontrol
    playerctl
    wireplumber

    # Browsers
    firefox

    # Clipboard
    wl-clipboard
 
    # Development
    git
    libgcc
    vscodium-fhs

    # File Managers
    xfce.thunar

    # Font Managers
    font-manager

    # Graphics
    glxinfo

    # GTK
    adw-gtk3
    libsForQt5.ark
    libsForQt5.qt5.qtgraphicaleffects
    nwg-look

    # Hardware
    brightnessctl
    light
    lshw

    # Hyprland
    hypridle
    hyprlock
    hyprpanel

    wlogout
    xwayland

    # Keyboards
    fcitx5
    xkeyboard_config

    # Libraries
    glibc
    libGL
    libGLU
    libglvnd
    libnotify
    libz

    # Miscellaneous
    zip

    # Network
    busybox
    dbus
    networkmanagerapplet
    openssl

    # Nix
    nh
    nil
    nix-output-monitor
    nix-prefetch-git
    nvd

    # Notification
    dunst

    # Shells
    oh-my-zsh
    starship
    zsh

    # System Tools
    btop
    coreutils
    dconf
    lsd
    pkg-config
    pv

    # Terminal Emulators
    kitty

    # Utilities
    dconf
    fceux
    glibc
  ];

  environment.interactiveShellInit = ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export CMAKE_C_COMPILER=${pkgs.libgcc}/
    export CMAKE_CXX_COMPILER=${pkgs.libgcc}/

    alias tree='lsd --tree'
    alias ls='lsd $1'
  '';

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
    #package = pkgs.jdk17;
  };

  environment.etc = with pkgs; {
    "openjdk21".source = jdk21;
    #"openjdk17".source = jdk17;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [8080 5432];
  # networking.firewall.allowedUDPPorts = [5432];
  # networking.firewall.enable = false;

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

  environment.sessionVariables = {
    FLAKE = "/home/nixos/nixos";
  };
}
