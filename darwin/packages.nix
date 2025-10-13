{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      curl
      jq
      devenv

      imagemagick

      firefox
      karabiner-elements

      container
    ];
}
