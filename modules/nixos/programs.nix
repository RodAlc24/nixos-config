{
  flake.modules.nixos.laptop = {
    programs.zsh.enable = true;
    programs.firefox.enable = true;
    security.polkit.enable = true;
  };
}
