{pkgs, ...}: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      lua-language-server
      rust-analyzer
      pyright
      nil
      meson
      nodePackages_latest.typescript-language-server

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        config = toLua "require('Comment').setup()";
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }
      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }
      {
        plugin = lualine-nvim;
        config = toLuaFile ./nvim/plugin/lualine.lua;
      }
      {
        plugin = todo-comments-nvim;
        config = toLua "require('nvim-autopairs').setup()";
      }
      {
        plugin = neogit;
        config = toLua "require('neogit').setup()";
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/plugin/cmp.lua;
      }
      {
        plugin = startup-nvim;
        config = toLua "require('startup').setup({theme = \"dashboard\"})";
      }
      {
        plugin = telescope-media-files-nvim;
        config = toLua "require('telescope').load_extension('media_files')";
      }
      {
        plugin = presence-nvim;
        config = toLua "require('presence').setup({})";
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

      dressing-nvim
      telescope-nvim
      neodev-nvim
      noice-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      vim-floaterm
      nerdtree
      nvim-web-devicons
      vim-devicons
      nvim-dap
      mason-nvim
      nvim-autopairs
      plenary-nvim
      markdown-preview-nvim
      mkdir-nvim
      project-nvim
      refactoring-nvim
      mini-nvim
      vim-nix
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/mappings.lua}
    '';
  };
}
