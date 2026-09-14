{
  flake.modules.nixos.laptop = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      zip
      unzip
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
