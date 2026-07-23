{
  flake.modules.homeManager.rodalc = { lib, ... }: {
    home.username = "rodalc";
    home.homeDirectory = "/home/rodalc";
    home.stateVersion = "26.05";

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
      ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
  };
}
