# base.nix
{ pkgs, deps ? [] }:
let
  # Flatten all dependency lists into one
  allDeps = builtins.concatLists deps;
in
{
  name = "composed-dev";
  description = "Composed development environment";

  packages = with pkgs; [
    # Core/base packages that are always included
    go
    hugo
    dart-sass
    php82
    awscli2
  ] ++ allDeps;
}
