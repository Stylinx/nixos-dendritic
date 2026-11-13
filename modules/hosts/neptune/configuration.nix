{ self, inputs, ... }: {
  flake.nixosModules.neptuneConfiguration = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.commonImports
      self.nixosModules.neptuneHardwareConfiguration
      self.nixosModules.neptuneUndervolt
      self.nixosModules.neptuneUsers
      self.nixosModules.obsStudio
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
      self.nixosModules.gaming
      self.nixosModules.radicale # TEMPORARY FIX, MOVE LATER
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Neptune";
    };
    nixpkgs.config.permittedInsecurePackages = [
      "electron-41.10.6"
    ];
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vulkan-loader
        vulkan-validation-layers
        vulkan-tools
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
      ];
    };
    services.flatpak.enable = true;
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
