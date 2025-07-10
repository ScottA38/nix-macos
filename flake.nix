{
  description = "My system configuration";
  inputs = {
    # monorepo w/ recipes ("derivations")
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # manages configs
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # system-level software and settings (macOS)
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      darwin,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # TODO: replace with your username
      primaryUser = "YOUR_USERNAME";
    in
    {
      # build darwin flake using:
      # $ darwin-rebuild build --flake .#<name>
      darwinConfigurations."my-macbook" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin
          ./hosts/my-macbook/configuration.nix
          {
            # common nix settings
            nix = {
              settings = {
                experimental-features = [
                  "nix-command"
                  "flakes"
                ];
                # disabled due to https://github.com/NixOS/nix/issues/7273
                # auto-optimise-store = true;
              };
              gc = {
                automatic = true;
                options = "--delete-older-than 7d";
              };
            };
          }
        ];
        specialArgs = { inherit inputs self primaryUser; };
      };

    };
}
