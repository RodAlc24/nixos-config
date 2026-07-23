{ self, inputs, ... }:
{
  flake.nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
    modules = [
      ../../hosts/laptop/hardware-configuration.nix
      self.modules.nixos.laptop
    ];
  };
}
