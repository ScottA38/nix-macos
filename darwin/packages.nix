{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gh
    glow
    ucto
    chezmoi
    imagemagick
    airdrop-cli
  ];
}
