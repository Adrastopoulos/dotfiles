{ lib, ... }:
{
  # The nix `ghostty` package does not build on aarch64-darwin, so the app
  # itself comes from the homebrew cask in modules/darwin/homebrew.nix.
  # Setting package = null makes home-manager manage only the config file.
  programs.ghostty = {
    enable = true;
    package = null;

    # font-family, font-size, theme and background-opacity are supplied by
    # stylix's ghostty target (see modules/home/stylix.nix).
    settings = {
      keybind = [ "shift+enter=text:\\x1b\\r" ];
    };
  };

  # On macOS, ~/Library/Application Support/com.mitchellh.ghostty/config takes
  # precedence over the XDG config that home-manager writes, and Ghostty
  # recreates that file from a template whenever it is missing. Move it aside so
  # the nix-managed config in ~/.config/ghostty/config is the one that applies.
  home.activation.unshadowGhosttyConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ghostty_app_support="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    if [ -f "$ghostty_app_support" ]; then
      run mv "$ghostty_app_support" "$ghostty_app_support.before-nix"
    fi
  '';
}
