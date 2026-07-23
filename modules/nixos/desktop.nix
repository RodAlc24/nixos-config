{
  flake.modules.nixos.laptop = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    services.greetd = {
      enable = false;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${pkgs.hyprland}/share/wayland-sessions";
          user = "greeter";
        };
      };
    };

    services.logind.settings.Login = {
      HandlePowerKey = "ignore";
      HandleLidSwitch = "suspend";
    };
  };
}
