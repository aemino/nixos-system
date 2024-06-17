{ pkgs, ... }:
{
  home.packages = with pkgs; [ memento ];
}
