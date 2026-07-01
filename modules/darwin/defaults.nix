{
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.5;
      minimize-to-application = true;
      mru-spaces = false;
      show-recents = false;
    };

    finder = {
      ShowStatusBar = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "Nlsv";
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
    };

    screencapture = {
      location = "~/Desktop";
      type = "png";
      disable-shadow = true;
    };

    trackpad.Clicking = true;

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSDocumentSaveNewDocumentsToCloud = false;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        PMPrintingExpandedStateForPrint = true;
      };
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.screensaver" = {
        askForPassword = 1;
        askForPasswordDelay = 0;
      };
      "com.apple.ActivityMonitor".ShowCategory = 0;
    };
  };
}
