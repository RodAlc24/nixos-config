{
  flake.modules.homeManager.rodalc = { config, pkgs, ... }: {
    home.packages = [ pkgs.gotify-cli ];

    sops.templates."gotify-cli.json" = {
      path = "/home/rodalc/.config/gotify/cli.json";
      content = builtins.toJSON {
        token = config.sops.placeholder.gotify_token;
        url = config.sops.placeholder.gotify_url;
        defaultPriority = 5;
      };
    };
  };
}
