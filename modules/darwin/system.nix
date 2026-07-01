{ username, hostname, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 5;
  system.primaryUser = username;

  users.users.${username}.home = "/Users/${username}";

  networking.computerName = hostname;
  networking.hostName = hostname;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "@admin"
    ];
  };

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    interval.Day = 7;
    options = "--delete-older-than 30d";
  };

  programs.zsh.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;
  system.startup.chime = false;
}
