{ self, inputs, ... }:
{
  flake.modules.nixos.laptop = {
    imports = [ inputs.home-manager.nixosModules.default ];

    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users.rodalc = self.modules.homeManager.rodalc;
    };
  };
}
