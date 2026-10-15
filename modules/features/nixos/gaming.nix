{ pkgs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs.gamemode.enable = true;
    hardware.graphics.enable32Bit = true;
    environment.systemPackages = with pkgs; [
      prismlauncher
      supertuxkart
      (heroic.override {
        extraPkgs = pkgs': with pkgs'; [
          gamescope
          gamemode
        ];
      })
    ];
    programs.steam = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    programs.gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
