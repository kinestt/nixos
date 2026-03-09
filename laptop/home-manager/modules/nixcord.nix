{
  programs.nixcord = {
    enable = true;
    discord.equicord.enable = true;
    config = {
      plugins = {
        fakeNitro.enable = true;
        silentTyping.enable = true;
        quickMention.enable = true;
        quickReply.enable = true;
        messageLoggerEnhanced.enable = true; 
        NoRPC.enable = true;
        validUser.enable = true;
        validReply.enable = true;
      };
    };
  };
}      
