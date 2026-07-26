{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    home.packages = with pkgs; [
      file
      poppler-utils
      librsvg
    ];

    home.file.".config/ranger/scope.sh".source = ./files/ranger_scope.sh;

    programs.ranger = {
      enable = true;
      settings = {
        column_ratios = "1,3,3";
        # imagePreviewSupport = "true";
        use_preview_script = true;
        preview_images = true;
        preview_images_method = "iterm2";
        preview_script = "~/.config/ranger/scope.sh";
      };
    };
  };
}
