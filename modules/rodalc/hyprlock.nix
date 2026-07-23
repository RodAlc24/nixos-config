{
  flake.modules.homeManager.rodalc = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
          ingnore_empty_input = true;
        };
        background = {
          path = "screenshot";
          blur_passes = 2;
          blur_size = 2;
        };
        input-field = {
          size = "20%, 5%";
          rounding = 15;
          fade_on_empty = true;
          outline_thickness = 3;
          outer_color = "rgb(80,73,69)";
          inner_color = "rgb(40,40,40)";
          font_color = "rgb(235,219,178)";
          font_family = "JetBrains Mono Nerd";
          placeholder_text = "<i></i>";
          check_color = "rgb(251,73,52)";
          fail_color = "rgb(251,73,52)";
          fail_text = "<i></i>";
          capslock_color = "rgb(187,187,38)";
        };
      };
    };
  };
}
