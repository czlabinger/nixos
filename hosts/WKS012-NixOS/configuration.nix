{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/boot
    ./../../modules/nixos/nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  swapDevices = [{
    device = "/swapfile";
    size = 32 * 1024; # 32GB
  }];

  security.pam.services.hyprlock.text = "auth include login";

  networking.hostName = "WKS012-NixOS";

  # Enable networking
  networking.networkmanager.enable = true;

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

  services.xserver.desktopManager.gnome.enable = true;

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

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";

      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  
    # Audio
    pulseaudio
    pavucontrol
    playerctl
    wireplumber

    # Bluetooth
    bluez
    blueberry

    # Browsers
    firefox
    google-chrome

    # Clipboard
    wl-clipboard
 
    # Communication
    discord
    webcord
    whatsapp-for-linux

    # Cursors & Icons
    bibata-cursors
    beauty-line-icon-theme
    qogir-icon-theme
    nixos-icons

    # Development
    arduino
    arduino-ide
    alejandra
    cargo
    dart
    devpod
    docker
    flutter
    git
    git-lfs
    jdk21
    #jdk17
    gcc-arm-embedded
    gnumake
    maven
    nodePackages.typescript
    nodejs_22
    nix-prefetch-git
    ocamlPackages.ssl
    libgcc
    python311Packages.pip
    python311
    python311Packages.pip
    python311Packages.gpustat
    rust-analyzer
    rustup
    vim
    vimPlugins.flutter-tools-nvim
    vscodium-fhs
    cudaPackages.cudatoolkit

    # Editors
    gnome-text-editor
    neovide
    neovim

    # File Managers
    xfce.thunar

    # Font Managers
    font-manager

    # Graphics
    gimp
    glxinfo
    inkscape-with-extensions
    mupdf
    imagemagick

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
    hyprls
    hyprpicker
    wlogout

    hyprpanel

    slurp
    swww
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
    anki-bin
    cava
    fzf
    gnome-multi-writer
    grim
    hollywood
    texliveFull
    texlivePackages.latexmk
    spotify
    vlc
    wxmaxima
    ydotool
    zip
    zoxide
    cbonsai

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

    # Productivity
    foliate
    wpsoffice

    # Programming Tools
    arduino
    arduino-ide
    cmake
    dart
    flutter
    insomnia
    maven
    nodePackages.typescript
    nodejs_22
    ocamlPackages.ssl
    rust-analyzer
    rustup
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    yarn

    # Shells
    oh-my-zsh
    starship
    zsh

    # System Tools
    btop
    coreutils
    dconf
    lsd
    neofetch
    pkg-config
    pv
    virt-manager
    virtio-win
    virtiofsd

    # Terminal Emulators
    foot
    kitty

    # Text Editors
    gnome-text-editor
    vim
    vimPlugins.flutter-tools-nvim
    neovide
    neovim

    # Utilities
    appimage-run
    baobab
    busybox
    coreutils
    dconf
    fceux
    foliate
    glibc
    hollywood
    imagemagick
    lsd
    neofetch
    pkg-config
    pv
    steam
    teams-for-linux
    tesseract4
    virt-manager
    virtio-win
    virtiofsd

    pacman
  ];

  environment.interactiveShellInit = ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    export CMAKE_C_COMPILER=${pkgs.libgcc}/
    export CMAKE_CXX_COMPILER=${pkgs.libgcc}/

    alias nvim='neovide $1 --fork'
    alias tree='lsd --tree'
    alias ls='lsd $1'
  '';

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
    #package = pkgs.jdk17;
  };

  fonts.packages = with pkgs; [
    material-icons
    roboto-mono
    font-awesome
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono" "Iosevka" "SpaceMono"];})
  ];

  environment.etc = with pkgs; {
    "openjdk21".source = jdk21;
    #"openjdk17".source = jdk17;
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
    FLAKE = "/home/stoffi05/nixos";
  };
}
