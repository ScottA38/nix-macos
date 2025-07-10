{
  pkgs,
  primaryUser,
  ...
}:
{
  networking.hostName = "my-macbook";

  home-manager.users.${primaryUser} = {
    # home-manager packages and configuration
    home.packages = with pkgs; [
      graphite-cli
    ];

    programs = {
      # host-specific shell aliases, etc.
      zsh = {
        initContent = ''
          # Source custom scripts
          source ${./custom-scripts.sh}
        '';
      };
    };
  };
}
