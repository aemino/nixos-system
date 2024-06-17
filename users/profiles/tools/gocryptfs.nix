{ pkgs, ... }:
{
  home.packages = with pkgs; [ gocryptfs ];
}
