{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chezmoi
    devenv
    just
    ripgrep
    fd
    jq
    tree
    wget
    htop
  ];
}
