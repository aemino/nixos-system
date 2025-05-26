{ pkgs, ... }:
{
  home.packages = with pkgs; [ phosphor-icons ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        height = 24;
        spacing = 4;

        modules-left = [ "niri/workspaces" ];

        modules-center = [ "niri/window" ];

        modules-right = [
          "tray"
          "wireplumber"
          "backlight"
          "network"
          "battery"
          "clock"
        ];

        backlight = {
          format = "{icon} {percent}%";
          format-icons = [ "" ];
        };

        battery = {
          interval = 5;

          states = {
            warning = 30;
            critical = 15;
          };

          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];

          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";

          format-time = "{H}:{m}";

          tooltip-format = "{timeTo} ({power:.1f} W)";
        };

        network = {
          format-icons = [
            ""
            ""
            ""
            ""
          ];

          format-disconnected = " {ifname}";
          format-wifi = "{icon}";
          format-ethernet = "";

          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
        };

        wireplumber = {
          format-icons = [
            ""
            ""
            ""
          ];

          format = "{icon} {volume}%";
          format-muted = " {volume}%";
        };

        "niri/window" = {
          format = "{:.50}";
        };
      };
    };
    style = ''
      * {
          font-size: 14px;
          border-radius: 5px;
      }

      window#waybar {
          font-family: monospace, Phosphor-Fill;
          background-color: transparent;
          border-bottom: 0px;
          color: #ebdbb2;
          transition-property: background-color;
          transition-duration: .5s;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      window#waybar.empty #window {
          background-color: transparent;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      .modules-right {
          margin: 10px 10px 0 0;
      }
      .modules-center {
          margin: 10px 0 0 0;
      }
      .modules-left {
          margin: 10px 0 0 10px;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          /* box-shadow: inset 0 -3px transparent; */
          border: none;
          box-shadow: none;
      }

      button:hover {
          background: unset;
          box-shadow: none;
      }

      #workspaces {
          background-color: #282828;
          padding: 0;
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ebdbb2;
          border-radius: 0;
          transition-property: background-color, color;
          transition-duration: 400ms;
      }

      #workspaces button:first-child {
          border-radius: 5px 0 0 5px;
      }

      #workspaces button:last-child {
          border-radius: 0 5px 5px 0;
      }

      #workspaces button:hover {
          background-color: #ebdbb2;
          color: #d79921;
      }

      #workspaces button.focused {
          background-color: #665c54;
      }

      #workspaces button.urgent {
          background-color: #b16286;
      }

      .module {
          padding: 0 10px;
          background-color: #282828;
          color: #ebdbb2;
      }

      #mode {
          background-color: #689d6a;
          color: #282828;
          /* box-shadow: inset 0 -3px #ffffff; */
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #cava {
          padding: 0 5px;
      }

      #battery.charging, #battery.plugged {
          background-color: #98971a;
          color: #282828;
      }

      @keyframes blink {
          to {
              background-color: #282828;
              color: #ebdbb2;
          }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
          background-color: #cc241d;
          color: #ebdbb2;
          animation-name: blink;
          animation-duration: 1000ms;
          animation-timing-function: steps(24);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
          background-color: #000000;
      }

      #wireplumber.muted {
          background-color: #458588;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
      }

      #mpris.playing {
          background-color: #d79921;
          color: #282828;
      }

      #tray menu {
          font-family: sans-serif;
      }

      #scratchpad.empty {
          background: transparent;
      }
    '';
  };
}
