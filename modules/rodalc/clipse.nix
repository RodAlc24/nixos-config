{
  flake.modules.homeManager.rodalc = {
    services.clipse = {
      enable = true;
      settings = {
        themeFile = "custom_theme.json";
        deleteAfter = 60 * 60 * 24;
        keyBindings = {
          "choose" = "enter";
          "up" = "k";
          "down" = "j";
          "nextPage" = "l";
          "prevPage" = "h";
          "home" = "g";
          "end" = "G";
          "filter" = "/";
          "more" = "?";
          "preview" = "p";
          "quit" = "q,esc";
          "remove" = "x";
          "selectUp" = "K";
          "selectDown" = "J";
          "selectSingle" = "space";
          "togglePin" = "P";
          "togglePinned" = "tab";
          "yankFilter" = "ctrl+s";
          "clearSelected" = "S";
        };
      };
      theme = {
        UseCustom = true;
        TitleFore = "#83a598";
        TitleInfo = "#8ec07c";
        NormalTitle = "#ebdbb2";
        DimmedTitle = "#ebdbb2";
        SelectedTitle = "#fabd2f";
        NormalDesc = "#8ec07c";
        DimmedDesc = "#8ec07c";
        SelectedDesc = "#fabd2f";
        StatusMsg = "#8ec07c";
        PinIndicatorColor = "#fb4934";
        SelectedBorder = "#3498db";
        SelectedDescBorder = "#b8bb26";
        FilteredMatch = "#ebdbb2";
        FilterPrompt = "#83a598";
        FilterInfo = "#8ec07c";
        FilterText = "#b8bb26";
        FilterCursor = "#b8bb26";
        HelpKey = "#fe8019";
        HelpDesc = "#b8bb26";
        PageActiveDot = "#b8bb26";
        PageInactiveDot = "#fe8019";
        DividerDot = "#8ec07c";
        PreviewedText = "#ebdbb2";
        PreviewBorder = "#8ec07c";
      };
    };
  };
}
