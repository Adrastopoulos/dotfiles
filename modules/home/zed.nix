{ pkgs, ... }:
{
  # Zed is the editor and the agent UI. omp runs inside the Agent Panel as an
  # ACP external agent, so omp keeps its own models, tools, skills, and memory.
  # Theme and fonts come from stylix's zed target (see modules/home/stylix.nix).
  # Settings stay mutable: home-manager merges these keys into
  # ~/.config/zed/settings.json and keeps changes made in the Zed UI.
  #
  # Zed loads the login-shell environment for each project, so language
  # servers go on the user PATH. extraPackages would only wrap the zeditor
  # CLI, not Zed.app started from the Dock.
  home.packages = [ pkgs.nixd ];

  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "terraform"
      "dockerfile"
    ];

    userSettings = {
      agent_servers."Oh My Pi" = {
        type = "custom";
        # Absolute path: Zed started from the Dock does not get the
        # homebrew directories that zsh adds to PATH.
        command = "/opt/homebrew/bin/omp";
        args = [ "acp" ];
      };

      # Resolves from ~/Projects/<repo> to ~/Worktrees/<repo>/<name>, where
      # the worktree skill puts manual worktrees.
      git.worktree_directory = "../../Worktrees";

      terminal.max_scroll_history_lines = 3000;
    };
  };
}
