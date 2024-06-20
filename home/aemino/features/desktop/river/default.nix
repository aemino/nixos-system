{
  imports = [ ../common ];

  wayland.windowManager.river = {
    enable = true;
    settings = {
      default-layout = "rivertile";
      map = {
        normal = {
          "Super+Shift E" = "exit";
          "Super+Shift Q" = "close";
          "Super Return" = "spawn alacritty";
          "Super Tab" = "spawn fuzzel";
        };
      };
      spawn = [ "rivertile" ];
    };
  };
}
