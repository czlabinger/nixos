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

  security.pam.services.hyprlock.text = "auth include login";

  networking.hostName = "matthiasLaptop";
  #networking.wireless.enable = true;

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

  # Enable the KDE Plasma Desktop Environment.
  #services.displayManager.sddm = {
  #  enable = true;
  #  wayland.enable = true;
  #  theme = "${import ../../modules/nixos/sddm/tokyo-night.nix {inherit pkgs;}}";
  #};
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

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [mesa];
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [mesa];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matthias = {
    isNormalUser = true;
    description = "Matthias";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "video" "docker" "libvirtd"];
    packages = with pkgs; [
      firefox
    ];
  };

  users.extraGroups.docker.members = ["username-with-access-to-socket"];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "matthias" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wireplumber
    dunst
    vim
    wget
    #tree
    vscode
    git
    alejandra
    libnotify
    webcord
    light
    foot
    kitty
    xfce.thunar
    gnome-text-editor
    wpsoffice
    gnome.gnome-control-center
    pavucontrol
    gnome.gnome-system-monitor
    btop
    wlogout
    grim
    slurp
    wl-clipboard
    playerctl
    ydotool
    swww
    fcitx5
    gnome.gnome-keyring
    polkit
    polkit_gnome
    hypridle
    dbus
    hyprlock
    wofi
    busybox
    networkmanagerapplet
    bluez
    blueberry
    pulseaudio
    zsh
    oh-my-zsh
    starship
    gnome2.gtkglext
    coreutils
    nwg-look
    beauty-line-icon-theme
    baobab
    jdk21
    maven
    jetbrains.idea-ultimate
    eclipses.eclipse-java
    wxmaxima
    notion-app-enhanced
    docker
    insomnia
    neofetch
    hollywood
    whatsapp-for-linux
    neovim
    neovide
    nodePackages.typescript
    luajitPackages.lua-lsp
    python3
    nodejs_22
    nodePackages_latest.bash-language-server
    vlc
    spotify
    cargo
    rustup
    rust-analyzer
    yarn
    mesa
    mupdf
    light
    nil
    gimp
    bibata-cursors
    adw-gtk3
    qogir-icon-theme
    virt-manager
    google-chrome
    discord
    glxinfo
    python311Packages.pip
    arduino-ide
    arduino
    nixos-icons
    nix-prefetch-git
    libsForQt5.qt5.qtgraphicaleffects
    appimage-run
    virtio-win
    virtiofsd
    lsd
    libglvnd
    glibc
    flutter
    dart
    libsForQt5.ark
    pv
    kdePackages.polkit-kde-agent-1
    gnome-multi-writer
    nh
    nix-output-monitor
    nvd
    tesseract4
    zoxide
    brightnessctl
    imagemagick
    vmware-workstation
    warp-terminal
  ];

  environment.interactiveShellInit = ''
    alias nvim='neovide $1 --fork'
    alias tree='lsd --tree'
    alias ls='lsd $1'
    alias cd='z $1'
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
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono" "Iosevka" "SpaceMono"];})
  ];

  environment.etc = with pkgs; {
    "openjdk21".source = jdk21;
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
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

  #networking.firewall = {
  #  enable = false;
  #};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [8080 5432];
  # networking.firewall.allowedUDPPorts = [5432];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  system.stateVersion = "23.11"; # Don't edit!

  programs.light.enable = true;
  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.hyprlock.package = inputs.hyprlock.packages."${pkgs.system}".hyprlock;
  
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.dbus.packages = with pkgs; [
    xfce.xfconf
  ];

  environment.sessionVariables = {
    FLAKE = "/home/matthias/nixos";
  };
}
