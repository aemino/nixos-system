{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri

    ../common
    ../common/clipboard.nix
    ../common/numbat.nix
    ../common/screenshot.nix

    ./waybar.nix
  ];

  home.packages = with pkgs; [ xwayland-satellite ];

  programs.niri = {
    package = pkgs.niri;
    enable = true;

    settings = {
      environment = {
        NIXOS_OZONE_WL = "1";
        DISPLAY = ":0";
      };

      spawn-at-startup = [
        { command = [ "waybar" ]; }
        { command = [ "xwayland-satellite" ]; }
      ];

      window-rules = [
        # {
        #   matches = [ { app-id = "^com.gabm.satty$"; } ];
        #   open-floating = true;
        # }
        {
          matches = [ { app-id = "^calc$"; } ];
          open-floating = true;
          shadow = {
            enable = true;
          };
        }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+Shift+E".action = quit;
        "Mod+Shift+Q".action = close-window;

        "Mod+Return".action = spawn "alacritty";
        "Mod+Tab".action = spawn "fuzzel";

        "Mod+P".action =
          let
            screenshot = "grim -";
            edit = "satty --filename - --fullscreen --initial-tool crop --copy-command wl-copy --early-exit";
            reinterpret-mime = "wl-paste | wl-copy -t image/png";
          in
          spawn "sh" "-c" "${screenshot} | ${edit} && ${reinterpret-mime}";

        "Mod+C".action =
          spawn "alacritty" "--class" "calc" "--config-file" "${./alacritty-popup.toml}" "-e"
            "numbat";

        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;

        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Up".action = move-window-up;
        "Mod+Shift+Down".action = move-window-down;

        "Mod+Ctrl+Up".action = focus-workspace-up;
        "Mod+Ctrl+Down".action = focus-workspace-down;

        "Mod+Ctrl+Shift+Up".action = move-window-to-workspace-up;
        "Mod+Ctrl+Shift+Down".action = move-window-to-workspace-down;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+Alt+Left".action = set-column-width "-10%";
        "Mod+Alt+Right".action = set-column-width "+10%";
        "Mod+Alt+Up".action = set-window-height "+10%";
        "Mod+Alt+Down".action = set-window-height "-10%";

        "Mod+Shift+C".action = center-column;

        "Mod+Shift+F".action = fullscreen-window;
      };
    };
  };
}
