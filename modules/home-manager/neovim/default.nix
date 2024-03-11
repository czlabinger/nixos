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
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
      neodev-nvim
      {
        plugin = mini-nvim;
      }
      {
        plugin = vim-nix;
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/cmp.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/plugin/telescope.lua;
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

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      lualine-nvim
      nvim-web-devicons
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';
  };
}
