{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "lsd $1";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "colored-man-pages"];
      theme = "agnoster";
      extraConfig = ''
        eval "$(zoxide init zsh)"
        eval "$(onefetch --generate zsh)"
      '';
    };
  };
}
