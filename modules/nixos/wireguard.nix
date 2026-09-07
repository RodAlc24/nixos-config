{
  flake.modules.nixos.laptop = { pkgs, lib, ... }: {
    networking.firewall.allowedUDPPorts = [ 51820 ];
    networking.wg-quick = {
      interfaces = {
        wg-split = {
          privateKeyFile = "/etc/wireguard/laptop_private.key";
          address = [ "10.0.0.2/24" ];
          listenPort = 51820;
          dns = [ "10.0.0.1" ];
          peers = [
            {
              publicKey = "9vUv6DatrJehz5rlYTo81CgP6bd5eK5TykhBNBRDYFg=";
              allowedIPs = [
                "10.0.0.0/24"
              ];
              endpoint = "home.rodalc.eu:51169";
              persistentKeepalive = 25;
            }
          ];
        };
        wg-full = {
          privateKeyFile = "/etc/wireguard/laptop_private.key";
          address = [ "10.0.0.2/24" ];
          listenPort = 51820;
          dns = [ "10.0.0.1" ];
          peers = [
            {
              publicKey = "9vUv6DatrJehz5rlYTo81CgP6bd5eK5TykhBNBRDYFg=";
              allowedIPs = [
                "0.0.0.0/0"
              ];
              endpoint = "home.rodalc.eu:51169";
              persistentKeepalive = 25;
            }
          ];
        };
      };
    };

    systemd.services."wg-quick-wg-split".wantedBy = lib.mkForce [ ];
    systemd.services."wg-quick-wg-full".wantedBy = lib.mkForce [ ];

    systemd.tmpfiles.rules = [
      "d /var/lib/wireguard 0755 root root -"
    ];

    systemd.services.wg-mode-restore = {
      description = "Restore last used WireGuard mode";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "oneshot";
      script = ''
        STATE=/var/lib/wireguard/mode
        mode="split"
        if [[ -f "$STATE" ]]; then
          saved=$(cat "$STATE")
          [[ "$saved" == "split" || "$saved" == "full" || "$saved" == "down" ]] && mode="$saved"
        fi
        if [[ "$mode" != "down" ]]; then
          systemctl start "wg-quick-wg-$mode.service"
        fi
      '';
    };

    # Let non-root users start/stop *only* these two specific units, no sudo
    # needed. This is what lets waybar/wofi click the mode without a password
    # prompt (there's no TTY for sudo to prompt on in that context).
    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.systemd1.manage-units" &&
            (action.lookup("unit") == "wg-quick-wg-split.service" ||
             action.lookup("unit") == "wg-quick-wg-full.service") &&
            subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';

    environment.systemPackages = [
      (pkgs.writeShellScriptBin "wg-mode" ''
        set -euo pipefail
        STATE=/var/lib/wireguard/mode
        mode="''${1:-}"

        case "$mode" in
          split|full)
            systemctl stop wg-quick-wg-split.service wg-quick-wg-full.service 2>/dev/null || true
            systemctl start "wg-quick-wg-$mode.service"
            echo "$mode" > "$STATE"
            echo "Switched to: $mode (persisted)"
            ;;
          down)
            systemctl stop wg-quick-wg-split.service wg-quick-wg-full.service 2>/dev/null || true
            echo "down" > "$STATE"
            echo "Switched to: down (persisted)"
            ;;
          status)
            if systemctl is-active --quiet wg-quick-wg-full.service; then
              echo full
            elif systemctl is-active --quiet wg-quick-wg-split.service; then
              echo split
            else
              echo down
            fi
            ;;
          *)
            echo "Usage: wg-mode {split|full|down|status}"
            echo "Currently persisted: $(cat "$STATE" 2>/dev/null || echo unknown)"
            exit 1
            ;;
        esac
      '')

      (pkgs.writeShellScriptBin "wg-status" ''
        set -euo pipefail
        mode=$(wg-mode status)
        case "$mode" in
          full)  echo '{"text":" ","class":"full","tooltip":"WireGuard: full (all traffic)"}' ;;
          split) echo '{"text":" ","class":"split","tooltip":"WireGuard: split (10.0.0.0/24)"}' ;;
          *)     echo '{"text":" ","class":"down","tooltip":"WireGuard: down"}' ;;
        esac
      '')

      (pkgs.writeShellScriptBin "wg-menu" ''
        set -euo pipefail
        current=$(wg-mode status)

        declare -A labels=(
          [full]="Change to full"
          [split]="Change to split"
          [down]="Shut down"
        )

        options=()
        for m in full split down; do
          [[ "$m" != "$current" ]] && options+=("''${labels[$m]}")
        done

        chosen=$(printf '%s\n' "''${options[@]}" | ${pkgs.wofi}/bin/wofi --dmenu --prompt "WireGuard: $current")

        case "$chosen" in
          "Change to full")  wg-mode full ;;
          "Change to split") wg-mode split ;;
          "Shut down")       wg-mode down ;;
          *) exit 0 ;;
        esac

        pkill -RTMIN+8 waybar 2>/dev/null || true
      '')
    ];
  };
}
