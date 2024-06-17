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

      export VISUAL="code --wait"
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

      input "1133:16514:Logitech_MX_Master_3" {
        accel_profile "flat"
        pointer_accel 0.25
      }

      output eDP-1 scale 1.5
    '';

    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+Tab" = "exec ${pkgs.rofi}/bin/rofi -show run -modi drun";
        "${mod}+Shift+p" = "exec slurp | grim -g - - | wl-copy";
        "${mod}+Shift+Mod1+p" = "exec slurp -o | grim -g -00 - | wl-copy";
        "XF86MonBrightnessUp" = "exec light -A 5";
        "XF86MonBrightnessDown" = "exec light -U 5";
      };

      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.rofi}/bin/rofi -show run -modi drun";
    };
  };

  services.wlsunset = {
    enable = true;
    latitude = "32.9";
    longitude = "-117.2";

    temperature = {
      night = 4000;
    };
  };
}
