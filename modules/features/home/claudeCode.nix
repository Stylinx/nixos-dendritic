{ self, inputs, ... }: {
  flake.homeModules.claudeCode = { pkgs, ... }: {
    programs.claude-code = {
      enable = true;
      context = ''
        - This system runs NixOS. Never try to install global packages via npm, pip, cargo, or apt.
        - If a CLI tool or compiler is missing, suggest using `nix-shell -p <pkg>` or adding it to the project's `flake.nix`.
      '';
      settings = {
        permissions = {
          allow = [
            "Bash(git status:*)"
            "Bash(git diff:*)"
            "Bash(git log:*)"
            "Bash(nix flake check:*)"
          ];
        };
      };
    };
    home.packages = with pkgs; [
      claude-monitor
      claude-powerline
    ];
  };
}
