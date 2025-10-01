{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      #System tools
      curl
      vim
      jq
      tmux
      htop
      tree
      ripgrep
      zoxide
      ffmpeg

      #zsh tools 
      starship

      #Browser
      brave

      # programming languages
      #mise # node, deno, bun, rust, python, etc.

      # misc
      nil
      biome
      nixfmt-rfc-style
      yt-dlp
      ollama

      # fonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono

      # containers
      docker

      #Dev tools
      neovim 
      gh
      symfony-cli
      yarn
      glow
      awscli2
      devenv

      #IDEs
      vscode
    ];
  };
}
