{
  flake.modules.homeManager.rodalc = {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        # Wallpaper created with https://github.com/lunik1/nix-wallpaper
        # The NixOS logo is licensed under the Creative Commons Attribution 4.0 International License.
        # More info: https://github.com/NixOS/branding#logo-attribution
        preload = [ "./files/nixos-wallpaper.png" ];
        wallpaper = [
          {
            monitor = "";
            path = "./files/nixos-wallpaper.png";
          }
        ];
      };
    };
  };
}
