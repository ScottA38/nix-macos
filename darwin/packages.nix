{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gh
    glow
    ucto
    pipx
    chezmoi
    imagemagick
    airdrop-cli
    ollama
    tmux
    claude-code

    # Wordpress
    wp-cli
  ];
}
