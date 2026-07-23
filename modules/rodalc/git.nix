{
  flake.modules.homeManager.rodalc = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Rodrigo Alćantara";
          email = "rodrigo@rodalc.eu";
          signingKey = "B3C2EC84B1F8720DAD5E67A900DED25594B2BCE5";
        };
        core = {
          editor = "nvim";
          pager = "bat";
          quotepath = "off";
        };
        commit.gpgsign = true;
        pull.rebase = true;
        init.defaultBranch = "main";
      };
    };
  };
}
