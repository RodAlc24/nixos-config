{
  flake.modules.nixos.laptop = { lib, ... }: {
    boot.loader.systemd-boot.enable = lib.mkDefault true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 0;
    boot.kernelParams = [ "reboot=efi" ]; # Fix freezing on shutdown

    fileSystems."/".options = [
      "noatime"
      "nodiratime"
      "discard"
    ];
    boot.initrd.luks.devices.root = {
      device = "/dev/disk/by-label/luks-root";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
