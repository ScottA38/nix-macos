{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./direnv.nix 
    ./git.nix
    ./shell.nix
    ./nvim.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.05";
    sessionVariables = {
      # shared environment variables
    };

    # create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";
  };
}
