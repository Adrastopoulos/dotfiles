{ pkgs, ... }:
{
  home.packages = with pkgs; [
    just
    ripgrep
    fd
    jq
    tree
    wget
    htop
  ];
}
