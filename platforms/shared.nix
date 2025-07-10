{ ... }:
{
  imports = [
    ../modules/home-manager.nix
    ../modules/git.nix
    ../modules/zsh.nix
    ../modules/mise.nix
  ];

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
