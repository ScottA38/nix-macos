{ pkgs, ... }:

{
  name = "dev-base";
  description = "Default toolchain";

  packages = with pkgs; [
    go
    hugo
    dart-sass
    php82
  ];
}
