{ 
  self,
  inputs, 
  ... 
}: {
  flake.nixosModules.nvf = { 
    pkgs,
    ... 
  }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myNvf
    ];
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myNvf = (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        {
          vim = {
            viAlias = false;
            vimAlias = false;

            globals = {
              mapLeader = " ";
            };

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
            languages = {
              nix = {
                enable = true;
                lsp = {
                  enable = true;
                  servers = [
                    "nixd"
                  ];
                };
                treesitter.enable = true;
              };
            };
            treesitter = {
              indent.excludes = [ "nix" ];
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
            filetree = {
              neo-tree = {
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
        }
      ];
    })
    .neovim;
  };
}
