{ pkgs, ... }: {
  #programs.discord.enable = true;
  programs.nixcord = {
    enable = true;
    discord.enable = true;
    discord.package = pkgs.discord;
    discord.vencord.enable = true;
    config = {
      plugins = {
        fakeNitro.enable = true;
        silentTyping.enable = true;
        quickMention.enable = true;
        quickReply.enable = true;
        messageLogger.enable = true; 
        #NoRPC.enable = true;
        validUser.enable = true;
        validReply.enable = true;
      };
    };
  };
}      
