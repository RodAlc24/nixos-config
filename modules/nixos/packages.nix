{
  flake.modules.nixos.laptop = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gcc
      git
      vim
      neovim
      wget
      p7zip
      tree
      htop
    ];
  };
}
