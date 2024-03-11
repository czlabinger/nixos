{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      plenary-nvim
      gruvbox-material
      mini-nvim

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-java
        p.tree-sitter-rust
      ]))

      vim-nix
    ];

    #extraLuaConfig = ''
    #  ${buildins.readFile ./nvim/options.lua}
    #'';
  };
}
