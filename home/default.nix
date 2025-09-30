{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./git.nix
    ./shell.nix
    ./mise.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.05";
    sessionVariables = {
      # shared environment variables
      AWS_PROFILE="Maximillian CLI Access";
    };

    # create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";
  };
}
