{ 
  inputs, 
  ... 
}: {
  flake.nixosModules.nvf = { 
    ... 
  }: {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = false;
          vimAlias = false;

          opts = {
            wrap = true;
            number = true;
            relativenumber = true;
            cursorline = true;
            scrolloff = 10;
            sidescrolloff = 8;

            tabstop = 2;
            shiftwidth = 2;
            softtabstop = 2;
            expandtab = true;
            smartindent = true;
            autoindent = true;

            ignorecase = true;
            smartcase = true;
            incsearch = true;
            hlsearch = true;

            termguicolors = true;
            showmatch = true;
            matchtime = 2;
            cmdheight = 1;
            completeopt = "menuone,noinsert,noselect";

            backup = false;
            writebackup = false;
            swapfile = false;
            updatetime = 300;
            autoread =  true;
            autowrite = true;

            hidden = true;
            errorbells = false;
            backspace = "indent,eol,start";
            autochdir = false;
            selection = "exclusive";
            mouse = "a";
            encoding = "UTF-8";
          };
          clipboard = {
            enable = true;
            providers.wl-copy.enable = true;
            registers = "unnamedplus";
          };
          statusline = {
            lualine = {
              enable = true;
              icons.enable = true;
            };
          };
          tabline = {
            nvimBufferline = {
              enable = true;
            };
          };
          theme = {
            enable = true;
            name = "rose-pine";
            style = "main";
            transparent = true;
          };
          terminal = {
            toggleterm = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
