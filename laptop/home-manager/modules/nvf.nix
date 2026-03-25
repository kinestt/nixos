{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        lsp = {
          enable = true;
        };
        opts = {
          autoindent = true;
          tabstop = 2;
          shiftwidth = 2;
          termguicolors = true;
        };
        clipboard ={
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamedplus";
        };
        presence = {
          neocord = {
            enable = true;
          };
        };
        theme = {
          enable = true;
          name = "rose-pine";
          style = "main";
        };
        undoFile.enable = true;
      };
    };
  };
}