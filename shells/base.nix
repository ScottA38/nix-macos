{ pkgs, ... }:

{
  name = "dev-base";
  description = "Default toolchain";

  buildInputs = with pkgs; [
    git
    curl
    jq
    direnv

    nodejs
  ];
}
