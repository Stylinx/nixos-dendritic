{ self, inputs, ... }: {
  flake.nixosModules.batteryControl = { ... }: {
    services = {
      power-profiles-daemon.enable = false;
      upower.enable = true;
      tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "powersave";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
          CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";

          CPU_BOOST_ON_AC = 1;
          CPU_BOOST_ON_BAT = 1;

          RUNTIME_PM_ON_AC = "on";
          RUNTIME_PM_ON_BAT = "on";

          PCIE_ASPM_ON_AC = "default";
          PCIE_ASPM_ON_BAT = "default";

          PLATFORM_PROFILE_ON_AC = "performance";
          PLATFORM_PROFILE_ON_BAT = "balanced";


          START_CHARGE_THRESH_BAT0 = 75;
          START_CHARGE_THRESH_BAT1 = 75;

          STOP_CHARGE_THRESH_BAT0 = 80;
          STOP_CHARGE_THRESH_BAT1 = 80;

          USB_AUTOSUSPEND = 0;
        };
      };
    };
  };
}
