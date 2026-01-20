{
  pkgs,
  inputs,
  self,
  primaryUser,
  ...
}:
{
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      fpath=( ~/.zfunc "''${fpath[@]}" )
    '';
  };

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  environment.pathsToLink = [
    "/share/zsh"
  ];

  environment.etc = {
    "zsh-plugins/zsh-autosuggestions.zsh".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
    "zsh-plugins/zsh-syntax-highlighting.zsh".source = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
  };
}
