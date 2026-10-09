{ pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        # "Mono" variant forces icons into a single cell, which keeps
        # terminal columns aligned.
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes.terminal = 12;
    };

    targets.starship.enable = false;
  };
}
