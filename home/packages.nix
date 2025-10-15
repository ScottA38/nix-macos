{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      #System tools
      curl
      vim
      tmux
      htop
      tree
      ripgrep
      zoxide
      ffmpeg

      # shell tools
      starship
      vimPlugins.markdown-preview-nvim

      # Code formatters
      nixfmt-rfc-style

      #Browser
      firefox

      # misc
      biome
      ollama

      # fonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono

      # containers
      docker

      #Dev tools
      gh
      hugo
      symfony-cli
      yarn
      glow # Not showing in apps or on $PATH :(
      awscli2
      devenv
    ];
  };
}
