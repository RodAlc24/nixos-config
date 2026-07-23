{
  flake.modules.homeManager.rodalc = { config, ... }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        UserKnownHostsFile = "~/.ssh/known_hosts";
      };
      includes = [ "${config.sops.templates."ssh_config".path}" ];
    };

    sops.templates."ssh_config" = {
      path = "/home/rodalc/.ssh/config_sops";
      content = ''
        Host ${config.sops.placeholder."ssh1/name"}
          HostName ${config.sops.placeholder."ssh1/host"}
          User ${config.sops.placeholder."ssh1/user"}
          Port ${config.sops.placeholder."ssh1/port"}

        Host ${config.sops.placeholder."ssh2/name"}
          HostName ${config.sops.placeholder."ssh2/host"}
          User ${config.sops.placeholder."ssh2/user"}

        Host ${config.sops.placeholder."ssh3/name"}
          HostName ${config.sops.placeholder."ssh3/host"}
          User ${config.sops.placeholder."ssh3/user"}
      '';
    };
  };
}
