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
}
