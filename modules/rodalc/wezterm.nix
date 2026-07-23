{
  flake.modules.homeManager.rodalc = {
    programs.wezterm = {
      enable = true;
      colorSchemes = {
        my-gruvbox = {
          foreground = "#ebdbb2";
          background = "#282828";

          cursor_bg = "#bdae93";
          cursor_fg = "#282828";
          cursor_border = "#bdae93";

          selection_bg = "#d65d0e";
          selection_fg = "#ebdbb2";

          ansi = [
            "#3c3836"
            "#cc241d"
            "#98971a"
            "#d79921"
            "#458588"
            "#b16286"
            "#689d6a"
            "#a89984"
          ];

          brights = [
            "#928374"
            "#fb4934"
            "#b8bb26"
            "#fabd2f"
            "#83a598"
            "#d3869b"
            "#8ec07c"
            "#fbf1c7"
          ];
        };
      };

      settings = {
        color_scheme = "my-gruvbox";
        font_size = 12;
        warn_about_missing_glyphs = false;
        default_cursor_style = "SteadyBar";

        hide_tab_bar_if_only_one_tab = true;
        show_new_tab_button_in_tab_bar = false;
        show_close_tab_button_in_tabs = false;
        disable_default_key_bindings = true;
      };
      extraConfig = builtins.readFile ./files/wezterm.lua;
    };
  };
}
