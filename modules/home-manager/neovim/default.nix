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

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
      rust-analyzer
      pyright

      xclip
      wl-clipboard
    ];

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
      }
      nerdtree
      {
        plugin = startup-nvim;
        config = toLua "require(\"startup\").setup({theme = \"dashboard\"})";
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

      neodev-nvim
      noice-nvim

      cmp_luasnip
      cmp-nvim-lsp

      luasnip
      friendly-snippets

      vim-floaterm

      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }

      nvim-web-devicons

      vim-devicons

      nvim-dap
      mason-nvim
      nvim-autopairs

      {
        plugin = todo-comments-nvim;
        config = toLua "require('nvim-autopairs').setup()";
      }
      {
        plugin = neogit;
        config = toLua "require('neogit').setup()";
      }
      markdown-preview-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/mappings.lua}
    '';
  };
}
