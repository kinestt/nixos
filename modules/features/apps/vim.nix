{ self, inputs, ... }: {
  flake.nixosModules.vim = { pkgs, lib, ... }: {
    programs.vim = { 
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myVim;
    };
  };
  perSystem = { pkgs, lib, ... }: {
    packages.myVim = inputs.wrapper-modules.wrappers.vim.wrap {
    inherit pkgs;
      vimrc = "
         set number 
         set autoindent
         set smartindent
         set shiftwidth=2
         set expandtab
         syntax on 
         set ignorecase
         set clipboard=unnamedplus
         set showmatch
         set relativenumber
         let mapleader = ' '
      ";
    };
  };

} 
