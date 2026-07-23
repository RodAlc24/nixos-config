{
  flake.modules.homeManager.rodalc = {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [ "~/fondo.png" ];
        wallpaper = [
          {
            monitor = "";
            path = "~/fondo.png";
          }
        ];
      };
    };
  };
}
