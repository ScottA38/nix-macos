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
      "docker"
      "docker-credential-helper-ecr"
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
      "element"

      # Video-Editing
      "obs"

      # other
      "firefox"
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
