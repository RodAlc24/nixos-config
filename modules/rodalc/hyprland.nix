{
  flake.modules.homeManager.rodalc = {
    wayland.windowManager.hyprland = {
      enable = true;

      package = null;
      portalPackage = null;
      systemd.enable = false;

      extraConfig = builtins.readFile ./files/hyprland.lua;
    };
  };
}
