{ self, inputs, ... }:
{
  flake.modules.nixos.laptop = {
    imports = [ inputs.home-manager.nixosModules.default ];

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      sharedModules = [ inputs.sops-nix.homeManagerModules.sops ];
      users.rodalc = self.modules.homeManager.rodalc;
    };
  };
}
