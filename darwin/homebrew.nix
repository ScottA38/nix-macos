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

    # homebrew is best for GUI apps
    # nixpkgs is best for CLI tools
    casks = [
      "ghostty"
      "zed"
      
      # Design
      "inkscape"

      # messaging
      "slack"

      # Video-Editing
      "obs"

      # other
      "keeper-password-manager"
      "obsidian"
      "protonvpn"

      #Misc
      "anki"
      "spotify"
    ];
  };
}
