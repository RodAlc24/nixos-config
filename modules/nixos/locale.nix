{
  flake.modules.nixos.laptop = {
    time.timeZone = "Europe/Madrid";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "es";
    };
  };
}
