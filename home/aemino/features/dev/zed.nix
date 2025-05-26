{
  programs.zed-editor = {
    enable = true;

    userSettings = {
      disable_ai = true;

      theme = {
        mode = "dark";
        light = "Catppuccin Latte";
        dark = "Catppuccin Macchiato";
      };

      # editor settings
      buffer_font_family = "JetBrains Mono";
      tab_size = 2;
    };
  };
}
