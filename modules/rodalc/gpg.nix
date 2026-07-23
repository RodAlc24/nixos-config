{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtlSsh = 3600;
      sshKeys = [
        "6522CAEE4B2DB78DB1968B797815A64FE953A4CA"
        "E527ECCDDACCCC8822C89EBB481C0842F3E1FCD3"
      ];
      pinentry.package = pkgs.pinentry-qt;
      pinentry.program = "pinentry-qt";
    };
  };
}
