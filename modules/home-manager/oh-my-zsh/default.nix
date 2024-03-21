{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "colored-man-pages"];
      theme = "agnoster";
    };
    syntaxHighlighting.enable = true;
  };
}
