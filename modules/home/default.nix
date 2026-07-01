{ lib, ... }:
{
  imports = [
    ./shell.nix
    ./git.nix
    ./tools.nix
    ./packages.nix
    ./runtimes.nix
  ];

  home.stateVersion = "24.11";
  xdg.enable = true;

  home.file.".hushlogin".text = "";

  home.activation.unhideLibrary = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run /usr/bin/chflags nohidden ~/Library
  '';
}
