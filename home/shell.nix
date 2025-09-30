{ lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    /*
    zshConfigEarlyInit = lib.mkOrder 1000 ''
      if [ -e "$HOME/.env" ]; then
        source "$HOME/.env"
      fi

      ssh-add --apple-load-keychain 2>/dev/null || true
    '';
    */

    shellAliases = {
      la = "ls -la";
      ".." = "cd ..";
      "nix-switch" = "sudo darwin-rebuild switch --flake ~/.config/nix";
    };

    dirHashes = {
      projects = "$HOME/Projects";
      sw-apps = "./custom/apps/";
      sw-plugins = "./custom/plugins/";
      nix = "$HOME/.config/nix";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
    };
  };
}
