{
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "my-macbook";

  # host-specific homebrew casks
  homebrew.casks = [
    # "slack"
  ];

  home-manager.users.${primaryUser} = {
    # home-manager packages and configuration
    home.packages = with pkgs; [
      graphite-cli
    ];

    programs = {
      # host-specific shell aliases, etc.
      zsh = {
        initContent = ''
          # Source shell functions
          source ${./shell-functions.sh}
        '';
      };
    };
  };
}
