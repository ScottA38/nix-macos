{
  pkgs,
  primaryUser,
  lib,
  ...
}:
{
  networking.hostName = "my-macbook";

  # host-specific homebrew casks
  homebrew.casks = [
    # "slack"
  ];

  environment.systemPackages = with pkgs; [
    curl
    jq
    devenv
    direnv
  ];

  # host-specific home-manager configuration
  home-manager.users.${primaryUser} = {
    home.packages = with pkgs; [
      graphite-cli
    ];

    programs = {
      zsh = {
        initContent =
          let
            zshConfigEarlyInit = lib.mkOrder 1000 ''
              if [ -e "$HOME/.env" ]; then
                source "$HOME/.env"
              fi

              ssh-add --apple-load-keychain 2>/dev/null || true
            '';

            zshConfigGeneral = lib.mkOrder 1500 ''
              export PATH="$HOME/.nix-profile/bin:$PATH"
              export PATH="$HOME/.cargo/bin:$PATH"
              export PATH="/run/current-system/sw/bin:$PATH"
              export PATH="/opt/homebrew/bin:$PATH"
              export PATH="/opt/local/bin:$PATH"

              export MANPAGER="nvim +Man!"
            '';
          in
          lib.mkMerge [
            zshConfigEarlyInit
            zshConfigGeneral
          ];
      };
    };
  };
}
