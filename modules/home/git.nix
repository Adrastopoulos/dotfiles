{
  config,
  fullName,
  email,
  ...
}:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      side-by-side = true;
    };
  };

  programs.git = {
    enable = true;

    signing = {
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      format = "ssh";
      signByDefault = true;
    };

    includes = [ { path = "~/.gitconfig.local"; } ];

    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      "Thumbs.db"
      "*~"
      "*.swp"
      "*.swo"
      ".netrwhist"
      ".vscode/"
      ".idea/"
      "*.iml"
      "node_modules/"
      "__pycache__/"
      "*.py[cod]"
      ".venv/"
      "dist/"
      "build/"
      ".env"
      ".env.local"
      "*.key"
      "*.pem"
    ];

    settings = {
      core = {
        editor = "vim";
        autocrlf = "input";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
      rebase.autostash = true;
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "default";
      };
      merge = {
        log = true;
        conflictstyle = "zdiff3";
      };
      rerere.enabled = true;
      color.ui = "auto";
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.ssh/allowed_signers";

      alias = {
        st = "status -s";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        d = "diff";
        ds = "diff --staged";
        amend = "commit --amend --no-edit";
        undo = "reset HEAD~1 --mixed";
        branches = "branch -a --sort=-committerdate";
      };
    };
  };

  xdg.configFile."git/identity".text = ''
    [user]
      name = ${fullName}
      email = ${email}
  '';
}
