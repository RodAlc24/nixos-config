{
  flake.modules.nixos.laptop = {
    services.printing.enable = true;
    services.tailscale.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
