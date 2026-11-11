{ self, inputs, ... }: {
  flake.nixosModules.generalInit = { pkgs, ... }: {
    users.users.general = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "render" ];
    };
  };
  flake.homeModules.generalConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.commonImports
      self.homeModules.vesktop
    ];
    programs.bash.enable = true;
    programs.starship.presets = [ "jetpack" ];
    home.stateVersion = "26.05";
  };
}
