{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.bat = {
    enable = true;
    config = {
      style = "numbers,changes,header";
      italic-text = "always";
      pager = "less -FR";
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      search_mode = "fuzzy";
      filter_mode = "global";
      inline_height = 20;
      show_preview = true;
      keymap_mode = "auto";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      command_timeout = 1000;
      format = "[┌─](bold green)$username$hostname$directory$git_branch$git_status$git_state\n[└─](bold green)$character";
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
      directory = {
        format = "[$path]($style)[$read_only]($read_only_style) ";
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = " ";
        style = "bold purple";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bold yellow";
      };
      nodejs.format = "via [$symbol($version)]($style) ";
      python.format = "via [$symbol$version]($style) ";
      rust.format = "via [$symbol($version)]($style) ";
      gcloud.disabled = true;
      docker_context.disabled = true;
    };
  };
}
