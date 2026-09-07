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
          spacing = 2;

          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [
            "network#wifi"
            "network#eth"
            "custom/wireguard"
            "pulseaudio"
            "disk"
            "memory"
            "cpu"
            "battery"
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
            tooltip = false;
          };

          "memory" = {
            format = "  {percentage}%";
            tooltip = false;
          };

          "cpu" = {
            format = "  {usage}%";
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
          "network#wifi" = {
            interface = "wlp1s0";
            format = "{essid} {icon}";
            format-alt = "{ipaddr} {icon}";
            format-icons = {
              "disconnected" = "󰖪 ";
              "wifi" = [
                "󰤯 "
                "󰤟 "
                "󰤢 "
                "󰤨 "
              ];
            };
            interval = 5;
            tooltip = false;
          };
          "network#eth" = {
            interface = "enp3s0f3u2u4c2";
            format = "󰈀 ";
            format-alt = "{ipaddr} 󰈀 ";
            format-disconnected = "";
            tooltip = false;
          };
          "custom/wireguard" = {
            exec = "wg-status";
            return-type = "json";
            interval = 10;
            signal = 8;
            on-click = "wg-menu";
            tooltip = false;
          };
        };
      };
      style = builtins.readFile ./files/waybar.css;
    };
  };
}
