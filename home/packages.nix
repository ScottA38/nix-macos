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

      # shell tools
      #neovim 
      starship
      vimPlugins.markdown-preview-nvim

      #Browser
      brave

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
