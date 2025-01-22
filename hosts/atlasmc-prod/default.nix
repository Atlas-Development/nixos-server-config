{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ../common
    ./hardware-configuration.nix
    ./minecraft-servers.nix
    ./networking.nix
  ];

  config = {

    networking.hostName = "atlasmc-prod";
    services.qemuGuest.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    common.optional.mariadb.enable = true;
    
  };
}
