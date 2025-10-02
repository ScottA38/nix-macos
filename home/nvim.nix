{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;

    extraPackages = with pkgs; [
      tree-sitter

      nil
      nixpkgs-fmt
      statix
    ];
  };

  xdg.configFile.nvim = {
    source = ../neovim;
    recursive = true;
  };
}
