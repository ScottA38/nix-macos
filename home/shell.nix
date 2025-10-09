{ lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent =
      let
        zshConfigEarlyInit = lib.mkOrder 1000 ''
          if [ -e "$HOME/.env" ]; then
            source "$HOME/.env"
          fi

          ssh-add --apple-load-keychain 2>/dev/null || true
        '';

        zshConfigGeneral = lib.mkOrder 1500 ''
          export PATH="$HOME/.nix-profile/bin:$PATH"
          export PATH="$HOME/.cargo/bin:$PATH"
          export PATH="/run/current-system/sw/bin:$PATH"
          export PATH="/opt/homebrew/bin:$PATH"
          export PATH="/opt/local/bin:$PATH"

          export MANPAGER="nvim +Man!"
        '';
      in
      lib.mkMerge [
        zshConfigEarlyInit
        zshConfigGeneral
      ];

    shellAliases = {
      la = "ls -la";
      ".." = "cd ..";
      darwin-sw = "sudo darwin-rebuild switch --flake"; 
      rgrep = "grep -Rin";
      recents = "find ~/Downloads/ -mtime -1";
    };

    dirHashes = {
      projects = "$HOME/Projects";
      dev = "$HOME/dev";
      sw-apps = "./custom/apps/";
      sw-plugins = "./custom/plugins/";
      nix = "$HOME/.config/nix";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreAllDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
      extended = true;
    };
  };

  # Load zsh plugins
  programs.starship = {
    enable = true;
  };
}
