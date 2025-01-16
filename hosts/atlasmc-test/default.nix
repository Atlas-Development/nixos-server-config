{
  pkgs,
  lib,
  config,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    outputs.nixosModules.minecraft
  ];

  config = {

    networking.hostName = "atlasmc-test";
    boot.tmp.cleanOnBoot = true;
    zramSwap.enable = true;
    networking.domain = "";

    atlas.services.minecraft-servers = {
      "survival" = {
        enable = true;
        dataDir = "/opt/minecraft/survival";
      };
    };
  };
}
