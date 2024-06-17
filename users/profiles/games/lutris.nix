{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.full
    lutris
  ];
}
