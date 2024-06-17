{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    arc-theme
    mesa
    vulkan-tools
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers
  ];

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako
      alacritty
      rofi
      xwayland
      xdg-utils
      slurp
      grim
    ];
    extraSessionCommands = ''
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=sway
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
  };

  services.gnome.gnome-keyring.enable = true;
  programs.light.enable = true;
}
