{
  pkgs,
  inputs,
  primaryUser,
  nix-homebrew,
  ...
}:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
    nix-homebrew.darwinModules.nix-homebrew
  ];

  # home-manager configuration (integrates with nix-darwin)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${primaryUser} = {
      imports = [
        ../home
      ];
    };
  };

  # nix-homebrew configuration
  nix-homebrew = {
    enable = true;
    user = primaryUser;
    autoMigrate = true;
  };

  users.users.${primaryUser}.shell = pkgs.zsh;

  # macOS-specific Nix settings
  nix.enable = false; # using determinate installer
  nixpkgs.config.allowUnfree = true; # allow unfree packages

  # add homebrew to PATH
  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };

}
