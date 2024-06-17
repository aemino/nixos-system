{ pkgs, ... }:
{
  home.packages = with pkgs; [ imv ];

  programs.fish.functions.imv-rtl = ''
    imv -c 'bind <Left> next' -c 'bind <Right> prev' $argv
  '';
}
