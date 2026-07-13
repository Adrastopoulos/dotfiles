{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bun
    nodejs_22
    pnpm
    python313
    go
  ];
}
