{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
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
        "Noto Sans"
        "TakaoGothic"
      ];
      serif = [
        "Noto Serif"
        "TakaoMincho"
      ];
    };
  };
}
