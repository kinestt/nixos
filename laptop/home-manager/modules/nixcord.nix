{ pkgs, ... }: {
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      vencord.enable = false;
      equicord.enable = true;
    };
    config = {
      plugins = {
        fakeNitro.enable = true;
        silentTyping.enable = true;
        quickMention.enable = true;
        quickReply.enable = true;
        messageLogger.enable = true;
        showHiddenChannels.enable = true; 
        NoRPC.enable = true;
        validUser.enable = true;
        validReply.enable = true;
      };
    };
  };
}      
