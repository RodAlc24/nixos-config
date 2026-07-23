{
  flake.modules.homeManager.rodalc = { config, ... }: {
    sops = {
      age.keyFile = "/home/rodalc/.config/sops/age/keys.txt";

      defaultSopsFile = ../../secrets.json;
      defaultSymlinkPath = "/run/user/1000/secrets";
      defaultSecretsMountPoint = "/run/user/1000/secrets.d";

      secrets.gotify_url = {
        path = "${config.sops.defaultSymlinkPath}/gotify_url";
      };
      secrets.gotify_token = {
        path = "${config.sops.defaultSymlinkPath}/gotify_token";
      };
    };
  };
}
