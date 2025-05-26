{
  imports = [
    ./features
    ./features/desktop/niri
    ./features/desktop/input/fcitx
    ./features/dev
    ./features/games
    ./features/social
    ./features/media
    ./features/tools
  ];

  services.kanshi = {
    enable = true;

    settings = [
      {
        output.criteria = "Microstep MAG321UP OLED Unknown";
        output.scale = 1.5;
        output.mode = "3840x2160@164.992";
      }
      {
        profile.name = "default";
        profile.outputs = [
          {
            criteria = "Microstep MAG321UP OLED Unknown";
          }
        ];
      }
    ];
  };
}
