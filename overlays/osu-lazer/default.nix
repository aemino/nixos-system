final: prev:
let
  version = "2021.927.0";
in
{
  osu-lazer = prev.appimageTools.wrapType2 {
    name = "osu";

    src = prev.fetchurl {
      url = "https://github.com/ppy/osu/releases/download/${version}/osu.AppImage";
      sha256 = "sha256-1NYkVk+hqW84J6rfSTHgO9e8ztReYNLyMTwVuDm7RT8=";
    };

    extraPkgs = pkgs: with pkgs; [
      icu
    ];
  };
}
