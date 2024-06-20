{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-color-emoji
    takao
    jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "JetBrains Mono" ];
      sansSerif = [
        "Gothic"
        "Noto Sans"
      ];
      serif = [
        "Mincho"
        "Noto Serif"
      ];
    };
  };
}
