{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    home.packages = with pkgs; [
      wofi-pass
      wofi-emoji
    ];

    programs.wofi = {
      enable = true;
      style = builtins.readFile ./files/wofi.css;
      settings = {
        width = 500;
        height = 350;
        location = "center";
        show = "drun";
        prompt = "Search";
        allow_images = false;
        allow_markup = false;
        gtk_dark = true;
        insensitive = true;
        hide_scroll = true;
        no_actions = true;
      };
    };
  };
}
