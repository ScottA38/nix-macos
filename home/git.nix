{ primaryUser, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "ScottA38";
    userEmail = "simple.scott.94@googlemail.com"; 

    ignores = [ "**/.DS_STORE" ];

    aliases = {
      s = "status";
      remv = "remote -v";
      amen = "commit --amend --no-edit";
    };

    extraConfig = {
      github = {
        user = primaryUser;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
