{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    ./packages.nix
    ./homebrew.nix
    ./settings.nix
    ./zsh.nix
    ./direnv.nix
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  environment.systemPackages = with pkgs; [
    curl
    jq
    glow
    tree
    ffmpeg
    gnupg

    container
    docker

    pinentry_mac
    neovim
    starship

    git-lfs
  ];

  # nix config
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # disabled due to https://github.com/NixOS/nix/issues/7273
      # auto-optimise-store = true;
    };
    enable = false; # using determinate installer
  };

  nixpkgs.config.allowUnfree = true;

  # homebrew installation manager
  nix-homebrew = {
    user = primaryUser;
    enable = true;
    autoMigrate = true;
  };

  # macOS-specific settings
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
    shell = pkgs.zsh;
  };
  environment = {
    systemPath = [
      "/opt/homebrew/bin"
      "/Users/${primaryUser}/.config/python-bin"
    ];
    pathsToLink = [ "/Applications" ];
  };
}
