{ self, inputs, ... }: {
  flake.homeModules.vesktop = { pkgs, config, lib, ... }: {
    stylix.targets.vesktop.enable = true;
    programs.vesktop = {
      enable = true;
      settings = {
        minimizeToTray = false;
        autoMinimise = false;
        hardwareAcceleration = true;
        useEffectiveScreenShare = true;
      };
      vencord.settings = {
        plugins = {
          AnimateYourName.enabled = true;
          BetterFolders.enabled = true;
          ClearURLs.enabled = true;
          CopyUserURLs.enabled = true;
          ImageZoom.enabled = true;
          MemberCount.enabled = true;
          ReadNotFound.enabled = true;
          SilentTyping.enabled = true;
          ShowHiddenChannels.enabled = true;
          VolumeBooster.enabled = true;
          SpotifyControls.enabled = true;
          FakeNitro = {
            enabled = true;
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
          };
        };
      };
    };
  };
}
