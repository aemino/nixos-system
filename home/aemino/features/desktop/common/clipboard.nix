{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard-rs
    wl-clip-persist
  ];
}
