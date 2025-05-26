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
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 2.0;
          }
        ];
      }
    ];
  };
}
