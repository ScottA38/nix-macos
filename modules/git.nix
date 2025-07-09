_: {
  programs.git = {
    enable = true;
    userName = "YOUR_NAME"; # TODO replace
    userEmail = "YOUR_EMAIL"; # TODO replace

    lfs.enable = true;

    ignores = [ "**/.DS_STORE" ];

    extraConfig = {
      github = {
        user = "YOUR_USERNAME"; # TODO replace
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
