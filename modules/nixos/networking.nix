{
  flake.modules.nixos.laptop = {
    networking.hostName = "laptop";
    networking.networkmanager.enable = true;
  };
}
