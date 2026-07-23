{
  flake.modules.homeManager.rodalc = {
    programs.zathura = {
      enable = true;
      options = {
        font = "JetBrainsMono Nerd Font Mono 14";
        database = "sqlite";
        default-bg = "#282828";
        completion-bg = "#282828";
        completion-group-bg = "#282828";
        default-fg = "#ebdbb2";
        completion-fg = "#ebdbb2";
        completion-group-fg = "#ebdbb2";
        completion-highlight-bg = "#98971a";
        completion-highlight-fg = "#282828";
        guioptions = "sv";
        inputbar-bg = "#282828";
        inputbar-fg = "#98971a";
        statusbar-bg = "#282828";
        statusbar-fg = "#ebdbb2";
        highlight-active-color = "rgba(69,133,136,0.5)";
        highlight-color = "rgba(215,153,33,0.5)";
        highlight-fg = "#98971a";
        index-active-bg = "#98971a";
        index-active-fg = "#282828";
        index-bg = "#282828";
        index-fg = "#ebdbb2";
        render-loading-bg = "#282828";
        render-loading-fg = "#ebdbb2";
        notification-bg = "#282828";
        notification-fg = "#ebdbb2";
        selection-notification = false;
        scroll-step = 150;
        selection-clipboard = "clipboard";
        statusbar-basename = true;
        statusbar-home-tilde = true;
        statusbar-page-percent = true;
      };
    };
  };
}
