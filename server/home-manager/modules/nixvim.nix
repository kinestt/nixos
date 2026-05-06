{

  programs.nixvim = {
    enable = true;
    colorschemes.rose-pine.enable = true;
    plugins.lualine.enable = true;
    
    globalOpts = {
      number = true;
      relativenumber = true;
      cursorline = true;
      wrap = false;
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
      completeopt = [ "menuone" "noinsert" "noselect" ];

      swapfile = false;
      autoread = true;
      autowrite = false;

      hidden = true;
      errorbells = false;
      backspace = [ "indent" "eol" "start" ];
      autochdir = false;
      mouse = "a";
      selection = "exclusive";
      clipboard = {
      	providers.wl-copy.enable = true;
	register = "unnamedplus";
      };
      modifiable = true;
      encoding = "UTF-8";
    };
  };
}
