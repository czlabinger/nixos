{
  config,
  pkgs,
  ...
}: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }
      {
        plugin = plenary-nvim;
      }
      {
        plugin = gruvbox-material;
        config = "vim.cmd(\"colorscheme gruvbox\")";
      }
      {
        plugin = mini-nvim;
      }
      {
        plugin = vim-nix;
      }

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
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';
  };
}
