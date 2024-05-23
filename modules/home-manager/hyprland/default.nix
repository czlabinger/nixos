{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./hyprlock.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
    waybar
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    ########################### Plugins ################################
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];

    settings = {
      ######################### General Config #########################

      # MONITOR CONFIG
      monitor = [
        ",preferred,auto,1"
        ",addreserved, 0, 0, 0, 0"
      ];

      input = {
        kb_layout = "us, de";
        numlock_by_default = true;
        repeat_delay = 250;
        repeat_rate = 35;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
          clickfinger_behavior = true;
          scroll_factor = "0.5";
        };

        special_fallthrough = true;
        follow_mouse = 1;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 700;
        workspace_swipe_fingers = 3;
        workspace_swipe_cancel_ratio = "0.2";
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 10;
        workspace_swipe_create_new = true;
      };

      general = {
        # Gaps and border
        gaps_in = 4;
        gaps_out = 5;
        gaps_workspaces = 50;
        border_size = 1;

        # Fallback colors
        "col.active_border" = "rgba(0DB7D4FF)";
        "col.inactive_border" = "rgba(31313600)";

        resize_on_border = true;
        no_focus_fallback = true;
        layout = "dwindle";
      };

      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = false;
      };

      decoration = {
        rounding = 20;

        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 5;
          passes = 4;
          brightness = 1;
          noise = "0.01";
          contrast = 1;
        };
        # Shadow
        drop_shadow = false;
        shadow_ignore_window = true;
        shadow_range = 20;
        shadow_offset = "0 2";
        shadow_render_power = 2;
        "col.shadow" = "rgba(0000001A)";

        # Dim
        dim_inactive = false;
        dim_strength = "0.1";
        dim_special = 0;
      };

      animations = {
        enabled = true;
        # Animation curves

        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "fluent_decel, 0.1, 1, 0, 1"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
        ];

        # Animation configs
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2.5, md3_decel"
          "workspaces, 1, 7, fluent_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      misc = {
        vfr = 1;
        vrr = 1;

        focus_on_activate = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        enable_swallow = false;
        swallow_regex = "(foot|kitty|allacritty|Alacritty)";

        force_default_wallpaper = 0;
        new_window_takes_over_fullscreen = 2;
      };

      ######################### Window Rules #########################

      windowrule = [
        "noblur,.*"
        "float, ^(steam)$"

        # Dialogs
        "float,title:^(Open File)(.*)$"
        "float,title:^(Select a File)(.*)$"
        "float,title:^(Choose wallpaper)(.*)$"
        "float,title:^(Open Folder)(.*)$"
        "float,title:^(Save As)(.*)$"
        "float,title:^(Library)(.*)$"
        "float,^(com.github.Aylur.ags)"
      ];

      windowrulev2 = [
        "tile,class:^(wpsoffice)"
      ];

      layerrule = [
        "noanim, selection"
        "xray 1, .*"

        "noanim, noanim"
        "blur, noanim"
        "blur, gtk-layer-shell"
        "ignorezero, gtk-layer-shell"
        "blur, launcher"
        "ignorealpha 0.5, launcher"
        "blur, notifications"
        "ignorealpha 0.69, notifications"
        "blur, myBar"
        "ignorealpha 0.6, myBar"
      ];

      ######################### Keybinds #########################

      #################### It just works™ keybinds ###################
      # Volume
      bindl = [
        ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",Print,exec,grim - | wl-copy"
        "SuperShift, L, exec, sleep 0.1 && systemctl suspend"
      ];

      bind = [
        ", XF86MonBrightnessUp, exec, light -A 5"
        ", XF86MonBrightnessDown, exec, light -U 5"

        "Alt, I, exec, ydotool key 103:1 103:0"
        "Alt, K, exec, ydotool key 108:1 108:0"
        "Alt, J, exec, ydotool key 105:1 105:0"
        "Alt, L, exec, ydotool key 106:1 106:0"

        #################### Apps and Stuff ####################
        "Super, Super_L, exec, ~/.config/hypr/scripts/wofi_helper.sh"
        "Super, C, exec, code --password-store=gnome --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "SuperShift, B, exec, baobab / &"
        "Super, T, exec, kitty"
        "SuperShiftAlt, T, exec, kitty sleep 0.01 && nmtui"
        "Super, Return, exec, foot"
        "Super, E, exec, thunar"
        "Super, W, exec, firefox"
        "Super, X, exec, gnome-text-editor --new-window"
        "SuperShift, W, exec, wps"
        "ControlSuper, W, exec, webcord"
        "Super, I, exec, XDG_CURRENT_DESKTOP='gnome' gnome-control-center"
        "ControlSuper, V, exec, pavucontrol 4"
        "ControlShift, Escape, exec, gnome-system-monitor"
        "ControlAltShift, Escape, exec, kitty -T 'btop' btop"
        "Super, Q, killactive,"
        "SuperAlt, Space, togglefloating, "
        "ShiftSuperAlt, Q, exec, hyprctl kill"
        "ControlShiftAlt, Delete, exec, pkill wlogout || wlogout -p layer-shell"
        "ControlShiftAltSuper, Delete, exec, systemctl poweroff"

        #################### Screenshot ####################
        "SuperShift, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"

        #################### ImageToText ###################
        "SuperAltShift, S, exec,grim -g \"$(slurp -d -c D1E5F4BB -b 1B232866 -s 00000000)\" \"tmp.png\" && tesseract -l eng \"tmp.png\" - | wl-copy && rm \"tmp.png\" "

        #################### Playerctl #####################
        "SuperShift, N, exec, playerctl next || playerctl position `bc <<< \"100 * $(playerctl metadata mpris:length) / 1000000 / 100\"`"
        "SuperShift, B, exec, playerctl previous"
        "SuperShift, P, exec, playerctl play-pause"

        #################### Hyprland ####################
        "SUPER, grave, hyprexpo:expo, toggle"
        "Super, L, exec, hyprlock &"
        "Super+Shift, left, movewindow, l"
        "Super+Shift, right, movewindow, r"
        "Super+Shift, up, movewindow, u"
        "Super+Shift, down, movewindow, d"
        "Super, left, movefocus, l"
        "Super, right, movefocus, r"
        "Super, up, movefocus, u"
        "Super, down, movefocus, d"
        "Super, BracketLeft, movefocus, l"
        "Super, BracketRight, movefocus, r"
        "Control+Super, right, workspace, +1"
        "Control+Super, left, workspace, -1"
        "Control+Super, BracketLeft, workspace, -1"
        "Control+Super, BracketRight, workspace, +1"
        "Super+Alt, mouse_down, movetoworkspace, -1"
        "Super+Alt, mouse_up, movetoworkspace, +1"
        "Super, Minus, splitratio, -0.1"
        "Super, Equal, splitratio, 0.1"
        "Super, Semicolon, splitratio, -0.1"
        "Super, Apostrophe, splitratio, 0.1"
        "Super, F, fullscreen, 0"
        "Super, D, fullscreen, 1"

        #################### Move to workspace ####################
        "Super, 1, exec, hyprctl dispatch workspace 1"
        "Super, 2, exec, hyprctl dispatch workspace 2"
        "Super, 3, exec, hyprctl dispatch workspace 3"
        "Super, 4, exec, hyprctl dispatch workspace 4"
        "Super, 5, exec, hyprctl dispatch workspace 5"
        "Super, 6, exec, hyprctl dispatch workspace 6"
        "Super, 7, exec, hyprctl dispatch workspace 7"
        "Super, 8, exec, hyprctl dispatch workspace 8"
        "Super, 9, exec, hyprctl dispatch workspace 9"
        "Super, 0, exec, hyprctl dispatch workspace 10"

        #################### Move window to workspace ####################
        "Super+Alt, 1, exec, hyprctl dispatch movetoworkspacesilent 1"
        "Super+Alt, 2, exec, hyprctl dispatch movetoworkspacesilent 2"
        "Super+Alt, 3, exec, hyprctl dispatch movetoworkspacesilent 3"
        "Super+Alt, 4, exec, hyprctl dispatch movetoworkspacesilent 4"
        "Super+Alt, 5, exec, hyprctl dispatch movetoworkspacesilent 5"
        "Super+Alt, 6, exec, hyprctl dispatch movetoworkspacesilent 6"
        "Super+Alt, 7, exec, hyprctl dispatch movetoworkspacesilent 7"
        "Super+Alt, 8, exec, hyprctl dispatch movetoworkspacesilent 8"
        "Super+Alt, 9, exec, hyprctl dispatch movetoworkspacesilent 9"
        "Super+Alt, 0, exec, hyprctl dispatch movetoworkspacesilent 10"

        "Control+Super, Backslash, resizeactive, exact 640 480"
      ];

      bindm = [
        # Move/resize windows with Super + LMB/RMB and dragging
        "Super, mouse:272, movewindow"
        "Super, mouse:273, resizewindow"
        "Super, Z, movewindow"
      ];

      #################### Env ####################
      env = [
        "QT_IM_MODULE, fcitx"
        "XMODIFIERS, @im=fcitx"
        "SDL_IM_MODULE, fcitx"
        "GLFW_IM_MODULE, ibus"
        "INPUT_METHOD, fcitx"
        "QT_QPA_PLATFORM, wayland"
        "QT_QPA_PLATFORMTHEME, qt5ct"
        "WLR_NO_HARDWARE_CURSORS, 1"
        "HYPRCURSOR_THEME,adw-gtk3"
        "HYPRCURSOR_SIZE,24"
      ];

      #################### Execs ####################

      exec-once = [
        "swww kill; swww init"
        "fcitx5"
        "ags &"
        "gnome-keyring-daemon --start --components=secrets &"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "hypridle &"
        "dbus-update-activation-environment --all &"
        "sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        # Clipboard: history
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"

        # Cursor
        "hyprctl setcursor Bibata-Original-Classic 24"
      ];

      plugin = {
        hyprexpo = {
          workspace_method = "first 1";
        };
      };
    };
  };
}
