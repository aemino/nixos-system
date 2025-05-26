{ pkgs, ... }:
{
  imports = [
    ../common
    ../common/clipboard.nix
    ../common/screenshot.nix

    ./waybar.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  wayland.windowManager.river = {
    enable = true;

    settings = {
      default-layout = "rivertile";
      map = {
        normal =
          {
            "Super+Shift E" = "exit";
            "Super+Shift Q" = "close";
            "Super Return" = "spawn alacritty";
            "Super Tab" = "spawn fuzzel";
            "Super F" = "toggle-fullscreen";
            "Super P" = # this is very cursed, but we need to reinterpret the clipboard mime type as image/png because for some reason wl-copy fails to autodetect it
              ''
                spawn "grim - | satty --filename - --fullscreen --initial-tool crop --copy-command wl-copy --early-exit && wl-paste | wl-copy -t image/png"
              '';
          }
          // (
            let
              tags = {
                "1" = 1;
                "2" = 2;
                "3" = 4;
                "4" = 8;
                "5" = 16;
                "6" = 32;
                "7" = 64;
                "8" = 128;
                "9" = 256;
              };
            in
            builtins.listToAttrs (
              builtins.concatMap (
                name:
                let
                  tag = builtins.toString (builtins.getAttr name tags);
                in
                [
                  {
                    name = "Super ${name}";
                    value = "set-focused-tags ${tag}";
                  }
                  {
                    name = "Super+Shift ${name}";
                    value = "set-view-tags ${tag}";
                  }
                ]
              ) (builtins.attrNames tags)
            )
          );
      };
      spawn = [
        "rivertile"
        # "'wl-clip-persist --clipboard regular'"
        "waybar"
      ];
    };
  };

  xdg.portal = {
    enable = true;

    config = {
      preferred = {
        default = "wlr";
      };
    };

    extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
  };
}
