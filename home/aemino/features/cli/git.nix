{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      credential.helper = "libsecret";
    };
  };
}
