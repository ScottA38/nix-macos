{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  imports = [
    ./homebrew-common.nix
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
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
    extraSpecialArgs = {
      inherit inputs self;
    };
  };

  # macOS-specific settings (system-level)
  nix.enable = false; # using determinate installer
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true; # Allow unfree packages
  };

  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
    shell = pkgs.zsh;
  };

  environment = {
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };

}
