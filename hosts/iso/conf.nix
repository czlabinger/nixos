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

    # Bluetooth
    bluez
    blueberry

    # Browsers
    firefox

    # Clipboard
    wl-clipboard
 
    # Communication
    webcord
    whatsapp-for-linux

    # Cursors & Icons
    bibata-cursors
    beauty-line-icon-theme
    qogir-icon-theme
    nixos-icons

    # Development
    arduino-ide
    cargo
    dart
    devpod
    docker
    flutter
    git
    jdk21
    #jdk17
    gcc-arm-embedded
    gnumake
    maven
    nodePackages.typescript
    nodejs_22
    ocamlPackages.ssl
    libgcc
    python311Packages.pip
    rust-analyzer
    rustup
    vim
    vimPlugins.flutter-tools-nvim
    vscodium-fhs

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
    hyprpicker
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
    cava
    fzf
    grim
    hollywood
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

    # Utilities
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
  ];

  environment.interactiveShellInit = ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
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
