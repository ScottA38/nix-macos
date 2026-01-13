{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ucto
    chezmoi
    imagemagick
  ];
}
