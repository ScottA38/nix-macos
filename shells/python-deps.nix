# python-deps.nix
{ pkgs }:
[
  (pkgs.python3.withPackages (ps: with ps; [
    pip
    pyyaml
    tkinter
    pandas
    tabulate
    uv
  ]))
]
