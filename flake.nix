{
  description = "AtlasMC NixOS server configurations";

  inputs = {

    # Official NixOS package sources
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix-Minecraft
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {

      # ===== Overlays =====
      overlays = import ./overlays { inherit inputs; };

      /**
        ***** Nixos Configurations ******
      */
      nixosConfigurations = {

        "atlasmc-prod" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          # Pass all Inputs to the modules
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./hosts/atlasmc-prod
            ./users/xaver106
            ./users/endodd
          ];
        };

        "atlasmc-test" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          # Pass all Inputs to the modules
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./hosts/atlasmc-test
            ./users/xaver106
            ./users/endodd
          ];
        };

      };
    };
}
