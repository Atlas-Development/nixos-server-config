{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
  ];
  
  networking.hostName = "atlasmc-test";
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.domain = "";
}
