{
  flake.modules.homeManager.rodalc = {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          action = "systemctl poweroff";
          keybind = "s";
          label = "shutdown";
          text = "󰐥";
        }
        {
          action = "systemctl reboot";
          keybind = "r";
          label = "reboot";
          text = "󰜉";
        }
        {
          action = "systemctl suspend";
          keybind = "u";
          label = "suspend";
          text = "󰤄";
        }
        {
          action = "sleep 1 && loginctl lock-session";
          keybind = "l";
          label = "lock";
          text = "󰌾";
        }
        {
          action = "systemctl hibernate";
          keybind = "h";
          label = "hibernate";
          text = "󰒲";
        }
        {
          action = "loginctl terminate-user $USER";
          keybind = "e";
          label = "logout";
          text = "󰍃";
        }
      ];
      style = builtins.readFile ./files/wlogout.css;
    };
  };
}
