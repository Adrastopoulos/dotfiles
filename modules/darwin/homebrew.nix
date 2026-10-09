{
  homebrew = {
    enable = true;
    taps = [ "can1357/tap" ];
    brews = [
      "can1357/tap/omp"
      "colima"
      "docker"
      "docker-buildx"
      "docker-compose"
      "docker-credential-helper"
    ];
    casks = [
      "ghostty"
      "monitorcontrol"
      "ngrok"
    ];
  };
}
