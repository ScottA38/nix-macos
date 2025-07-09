{
  pkgs,
  ...
}:
{
  imports = [
    ../../platforms/darwin.nix
  ];

  networking.hostName = "my-macbook";

  # TODO: replace with your username
  home-manager.users.YOUR_USERNAME = {
    # home-manager packages and configuration
    home.packages = with pkgs; [
      graphite-cli
    ];

    programs = {
      # host-specific shell aliases, etc.
      zsh = {
        initContent = ''
          # Source custom scripts
          [ -f ~/.config/nix/hosts/my-macbook/custom-scripts.sh ] && source ~/.config/nix/hosts/my-macbook/custom-scripts.sh
        '';
      };
    };
  };
}
