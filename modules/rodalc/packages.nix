{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    home.packages = with pkgs; [
      file
      anki
      cargo
      nodejs_26
      brightnessctl
      grim
      slurp
      pulseaudio
      signal-desktop
      discord
      hyprpaper
      waybar
      gpclient
      nerd-fonts.dejavu-sans-mono
      pavucontrol
      wl-clipboard
      kitty
      typst

      age
      sops
    ];
  };
}
