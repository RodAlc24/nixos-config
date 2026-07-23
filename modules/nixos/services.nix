{
  flake.modules.nixos.laptop = {
    services.printing.enable = true;
    services.tailscale.enable = true;
  };
}
