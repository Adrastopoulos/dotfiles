{ config, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
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

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      reload = "exec zsh";
      cat = "bat";
    };

    history = {
      size = 10000;
      save = 10000;
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
