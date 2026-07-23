{
  flake.modules.homeManager.rodalc = { pkgs, ... }: {
    home.packages = with pkgs; [
      anki
      cargo
      grml-zsh-config
      brightnessctl
      grim
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
    ];
  };
}
