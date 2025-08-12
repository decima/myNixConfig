{
  inputs,
  lib,
  home-manager,
  system,
}@args:
{
  vmv2 = lib.nixosSystem {
    inherit system;
    modules = [
      ./vmv2/configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.decima = ../users/decima/vmv2.nix;
      }
    ];
  };

}
