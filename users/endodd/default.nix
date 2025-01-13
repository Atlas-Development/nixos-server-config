{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  users.users.end = {
    isNormalUser = true;
    description = "Endoddo";
    initialHashedPassword = "$6$Wij.Kslb8PRHdrrW$iXgOo.cSHVZnI52x7z.Y1rUbxy/uWHYd5aRu1VUWhEa6IQdfnqo56Itt0iCwmiIoVrXIGP31IWs8zozxLRAtF0";
    extraGroups = [
      "wheel"
    ];
    /*
      wheel: Group that can use sudo
    */

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMzVOzRuDB2DRESc1oKEdv55vp3kisDmO/nrLI5zQQn3 end"
    ];
  };
}
