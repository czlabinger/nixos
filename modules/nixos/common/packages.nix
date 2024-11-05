{pkgs, inputs, ...}: {

    environment.systemPackages =  with pkgs; [
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
        teams-for-linux

        # Cursors & Icons
        bibata-cursors
        beauty-line-icon-theme
        qogir-icon-theme
        nixos-icons

        # Development
        arduino
        arduino-ide
        devpod
        docker
        git
        jdk21
        gcc-arm-embedded
        gnumake
        maven
        nodePackages.typescript
        nodejs_22
        nixd
        ocamlPackages.ssl
        libgcc
        python311
        python311Packages.pip
        python311Packages.gpustat
        python311Packages.ipykernel
        vscodium-fhs

        # Editors
        gnome-text-editor
        neovide
        neovim
        zed-editor

        # File Managers
        xfce.thunar

        # Font Managers
        font-manager
        material-design-icons

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
        grim
        hypridle
        hyprlock
        hyprls
        hyprpicker
        hyprpanel
        inputs.hyprsysteminfo.packages.${pkgs.system}.default
        inputs.hyprpolkitagent.packages.${pkgs.system}.default
        inputs.hyprswitch.packages.${pkgs.system}.default
        slurp
        swww
        wlogout
        xwayland

        # Keyboards
        fcitx5
        xkeyboard_config

        # Libraries
        libGL
        libGLU
        libglvnd
        libnotify
        libz
        glibc
        libclang

        # Miscellaneous
        inputs.notion-calendar-electron.packages.${pkgs.system}.default
        onefetch
        texliveFull
        texlivePackages.latexmk
        spotify
        vlc
        wxmaxima

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
        insomnia
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

        # Utilities
        tesseract4
        wofi

        # QT
        kdePackages.qt6ct
        libsForQt5.qt5ct
   ];
}
