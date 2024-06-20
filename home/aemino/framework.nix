{
  imports = [
    ./features
    ./features/desktop/river
    ./features/dev
    ./features/games
    ./features/social
    ./features/media
  ];

  services.kanshi = {
    enable = true;
    systemdTarget = "river-session.target";

    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.5;
          }
        ];
      }
    ];
  };
}
