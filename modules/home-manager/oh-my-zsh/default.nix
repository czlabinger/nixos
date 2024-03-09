{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo" "colored-man-pages"];
      theme = "agnoster";
    };
    syntaxHighlighting.enable = true;
  };
}
