{ self, inputs, ... }: {
  flake.nixosModules.network = { pkgs, ... }: {
    programs.captive-browser = {
      enable = true;
      interface = "wlp3s0";
    };
    networking.networkmanager = {
      enable = true;
      settings.connectivity = {
        uri = "http://nmcheck.gnome.org/check_network_status.txt";
        response = "NetworkManager is online";
        interval = 300;
      };
    };
  };
}
