{ lib, pkgs, ... }:
let
  mod = "Mod4";
in
{
  wayland.windowManager.sway = {
    enable = true;

    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';

    extraConfig = ''
      input * {
        repeat_delay 250
        repeat_rate 35
      }

      input type:touchpad {
        tap enabled
        natural_scroll enabled
        click_method clickfinger
        scroll_factor 0.5
      }

      output eDP-1 scale 1.5
    '';

    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+Tab" = "exec ${pkgs.rofi}/bin/rofi -show run -modi drun";
      };

      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.rofi}/bin/rofi -show run -modi drun";
    };
  };
}
