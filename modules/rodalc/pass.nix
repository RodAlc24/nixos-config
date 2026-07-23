{
  flake.modules.homeManager.rodalc = {
    services.pass-secret-service.enable = true;
    programs.password-store.enable = true;
    programs.password-store.settings = {
      PASSWORD_STORE_SIGNING_KEY = "D1FA863BB909A81BEB49F3C783091DD07031A2DB";
      PASSWORD_STORE_X_SELECTION = "primary";
    };
  };
}
