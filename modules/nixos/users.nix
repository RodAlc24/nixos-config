{
  flake.modules.nixos.laptop = { pkgs, ... }: {
    users.users.rodalc = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "input"
        "docker"
      ];
      shell = pkgs.zsh;
    };
    users.users.root.shell = pkgs.zsh;

    services.getty = {
      autologinUser = "rodalc";
      autologinOnce = true;
    };
  };
}
