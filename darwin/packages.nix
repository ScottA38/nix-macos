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
    claude-code
  ];
}
