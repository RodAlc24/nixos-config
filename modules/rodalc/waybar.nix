{
  flake.modules.homeManager.rodalc = {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 34;
          margin-top = 0;
          margin-bottom = 5;
          margin-left = 0;
          margin-right = 0;
          spacing = 4;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [
            "keyboard-state"
            "pulseaudio"
            "disk"
            "memory"
            "cpu"
            "battry"
            "custom/power"
          ];

          "hyprland/workspaces" = {
            format = "{id}";
            sort-by-number = true;
          };

          "clock" = {
            format = "{:%H:%M}";
            format-alt = "{:%d/%m/%Y  %H:%M:%S}";
            tooltip = false;
            interval = 1;
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "󰖁  {volume}%";
            format-icons = {
              "speaker" = [
                "󰕿 "
                "󰖀 "
                "󰕾 "
              ];
            };
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            on-click-middle = "pavucontrol";
            scroll-step = 5;
          };

          "disk" = {
            format = "/ {percentage_used}%";
            path = "/";
            tooltip-format = "{used} used / {total} total";
          };

          "memory" = {
            format = "RAM {percentage}%";
            tooltip-format = "{used:0.1f} GiB / {total:0.1f} GiB";
          };

          "cpu" = {
            format = "CPU {usage}%";
            tooltip = false;
          };

          "battery" = {
            format = "{icon} {capacity}%";
            format-charging = "{icon} {capacity}%";
            format-icons = {
              "default" = [
                "󰂎 "
                "󰁺 "
                "󰁻 "
                "󰁼 "
                "󰁽 "
                "󰁾 "
                "󰁿 "
                "󰂀 "
                "󰂁 "
                "󰂂 "
                "󰁹 "
              ];
              "charging" = [
                "󰢟 "
                "󰢜 "
                "󰂆 "
                "󰂇 "
                "󰂈 "
                "󰢝 "
                "󰂉 "
                "󰢞 "
                "󰂊 "
                "󰂋 "
                "󰂅 "
              ];
            };
            states = {
              "warning" = 30;
              "critical" = 15;
            };
          };

          "custom/power" = {
            format = "⏻";
            on-click = "wlogout";
            tooltip = false;
          };

          "keyboard-state" = {
            numlock = true;
            capslock = true;
            format = "{name} {icon} ";
            format-icons = {
              "locked" = " ";
              "unlocked" = " ";
            };
            binding-keys = [
              1
              69
            ];
          };
        };
      };
      style = builtins.readFile ./files/waybar.css;
    };
  };
}
