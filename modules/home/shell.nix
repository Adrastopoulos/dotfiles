{ config, lib, ... }:
{
  home.sessionPath = [ "$HOME/.local/bin" ];

  home.sessionVariables = {
    EDITOR = "vim";
    # VISUAL is set per session in initContent below.
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;

    dotDir = config.home.homeDirectory;
    autocd = true;
    defaultKeymap = "emacs";
    setOptions = [ "HIST_VERIFY" ];

    initContent = lib.mkAfter ''
      path+=(/opt/homebrew/bin /opt/homebrew/sbin)

      # Open Zed for VISUAL (and so for git) on the Mac itself; SSH sessions
      # have no GUI, so they keep vim.
      if [[ -n $SSH_CONNECTION ]]; then
        export VISUAL=vim
      else
        export VISUAL="zeditor --wait"
      fi
    '';

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      reload = "exec zsh";
      cat = "bat";
      # nixpkgs installs the Zed CLI as zeditor.
      zed = "zeditor";
    };

    history = {
      size = 5000;
      save = 5000;
      extended = true;
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      findNoDups = true;
      saveNoDups = true;
    };
  };
}
