{
  flake.modules.homeManager.rodalc = {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })'";
        };
        listener = [
          {
            timeout = 270;
            on-timeout = "brightnessctl -s set 20";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300;
            on-timeout = "brightnessctl -r && loginctl lock-session";
          }
          {
            timeout = 360;
            on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = \"disable\" })'";
            on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = \"enable\" })' && brightnessctl -r";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
