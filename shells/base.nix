{ pkgs, ... }:

{
  name = "dev-base";
  description = "Default toolchain";

  packages = with pkgs; [
    git
    curl
    jq
    direnv
  ];
}
