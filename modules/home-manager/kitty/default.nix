{...}: {
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    font.name = "JetBrainsMono Nerd Font";
    settings = {
      confirm_os_window_close = -0;
      copy_on_select = true;
      clipboard_control = "write-clipboard read-clipboard write-primary read-primary";
      background_opacity = "0.5";
    };
  };
}
