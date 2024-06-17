{ lib, pkgs, ... }:
let
  mod = "Mod4";
in
{
  i18n.inputMethod = {
    enabled = "fcitx5";

    fcitx5.addons = with pkgs; [ fcitx5-mozc fcitx5-table-other ];
  };
}
