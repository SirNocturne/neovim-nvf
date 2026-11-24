# nvf module: your editor configuration. Edit here, then rebuild/run the package.
{pkgs, ...}: {
  config.vim = {
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      tree-sitter
    ];

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      termguicolors = true;
      signcolumn = "yes";
      scrolloff = 4;
      sidescrolloff = 8;
      undofile = true;
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
    };

    statusline.lualine = {
      enable = true;
      setupOpts.options.theme = "tokyonight";
    };

    tabline.nvimBufferline.enable = true;
    binds.whichKey.enable = true;
    notify.nvim-notify.enable = true;
    ui.noice.enable = true;

    visuals = {
      nvim-web-devicons.enable = true;
      indent-blankline.enable = true;
    };

    filetree.neo-tree.enable = true;
    telescope.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      setupOpts.signature.enabled = true;
    };
    autopairs.nvim-autopairs.enable = true;

    # Git integration
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    treesitter = {
      enable = true;
      indent.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix = {
        enable = true;
        format.enable = false;
      };
      python.enable = true;
      rust.enable = true;
      lua.enable = true;
      bash.enable = true;
      markdown.enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          nix = ["treefmt" "alejandra"];
        };
        default_format_opts.stop_after_first = true;

        formatters = {
          treefmt = {
            require_cwd = false;
          };
          alejandra.command = "${pkgs.alejandra}/bin/alejandra";
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
  };
}
