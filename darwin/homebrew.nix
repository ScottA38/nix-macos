{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    brews = [
      "pam-u2f"
      "awscli"
      "mysql"
    ];

    # homebrew is best for GUI apps
    # nixpkgs is best for CLI tools
    casks = [
      "ghostty"
      "zed"

      # Design
      "inkscape"
      "librecad"

      # messaging
      "slack"

      # Video-Editing
      "obs"

      # other
      "keeper-password-manager"
      "obsidian"
      "protonvpn"
      "brave-browser"
      "pycharm-ce"
      "postman"
      "libreoffice"
      "yubico-authenticator"
      "docker-desktop"
      "google-chrome"

      #Misc
      "anki"
      "spotify"
    ];
  };
}
