{
  flake.modules.nixos.laptop = {
    networking.firewall.allowedUDPPorts = [ 51820 ];
    networking.wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          privateKeyFile = "/etc/wireguard/laptop_private.key";
          ips = [ "10.0.0.2/24" ];
          listenPort = 51820;
          peers = [
            {
              name = "home-server";
              publicKey = "9vUv6DatrJehz5rlYTo81CgP6bd5eK5TykhBNBRDYFg=";
              allowedIPs = [
                "10.0.0.0/24"
              ];
              endpoint = "home.rodalc.eu:51169";
              persistentKeepalive = 25;
            }
          ];
        };
      };
    };
  };
}
