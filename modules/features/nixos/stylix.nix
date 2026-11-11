{ self, inputs, ... }: {
  flake.nixosModules.stylix = { config, pkgs, ... }: {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      homeManagerIntegration.autoImport = true;
      fonts = {
        serif = config.stylix.fonts.sansSerif;
        sansSerif = {
          package = pkgs.roboto;
          name = "Roboto";
        };
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
