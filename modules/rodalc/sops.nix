{
  flake.modules.homeManager.rodalc = { config, ... }: {
    sops = {
      age.keyFile = "/home/rodalc/.config/sops/age/keys.txt";

      defaultSopsFile = ../../secrets.json;
      defaultSymlinkPath = "/run/user/1000/secrets";
      defaultSecretsMountPoint = "/run/user/1000/secrets.d";

      secrets.gotify_url = { };
      secrets.gotify_token = { };

      secrets."ssh1/name" = { };
      secrets."ssh1/host" = { };
      secrets."ssh1/user" = { };
      secrets."ssh1/port" = { };

      secrets."ssh2/name" = { };
      secrets."ssh2/host" = { };
      secrets."ssh2/user" = { };

      secrets."ssh3/name" = { };
      secrets."ssh3/host" = { };
      secrets."ssh3/user" = { };
    };
  };
}
