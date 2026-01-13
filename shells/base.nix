{ pkgs, ... }:

{
  name = "dev-base";
  description = "Default toolchain";

  packages = with pkgs; [
    git
    gh
    curl
    jq
    direnv
    glow
    awscli2
  ];
}
