{
  flake.modules.nixos.laptop = {
    networking = {
      hostName = "laptop";
      nameservers = [
        "1.1.1.1"
      ];
      networkmanager.enable = true;
      networkmanager.dns = "none";
    };
  };
}
