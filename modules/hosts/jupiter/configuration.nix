{ self, inputs, ... }: {
  flake.nixosModules.jupiterConfiguration = { pkgs, config, ... }: {
    imports = [
      self.nixosModules.commonImports
      self.nixosModules.jupiterHardwareConfiguration
      self.nixosModules.jupiterUsers
      self.nixosModules.closeLaptopLid
      self.nixosModules.batteryControl
      self.nixosModules.laptopFanControl
    ];
    time.timeZone = "America/New_York";
    networking = {
      hostName = "Stylinx-Jupiter";
    };
    nixpkgs.config.allowUnfree = true;
    boot.loader.limine.extraEntries = ''
      /Windows
      protocol: efi
      path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';
    boot.kernelParams = [
      "amdgpu.dcdebugmask=0x10"
      "amdgpu.abmlevel=0"
      "nvidia-drm.fbdev=1"
      "ec_sys.write_support=1"
    ];
    services.xserver.videoDrivers = [
      "amdgpu"
      "nvidia"
    ];
    hardware = {
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          libva
          libva-utils
          mesa
          vulkan-validation-layers
          nvidia-vaapi-driver
        ];
      };
      nvidia = {
        open = false;
        modesetting.enable = true;
        powerManagement = {
          enable = true;
          finegrained = false;
        };
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          amdgpuBusId = "PCI:5:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
    environment.etc."nbfc/nbfc.json".text = ''
      {
        "SelectedConfigId": "HP Victus 16-e0xxx"
      }
    '';
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
  };
}
