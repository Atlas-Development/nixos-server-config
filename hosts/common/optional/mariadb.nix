{
  config,
  pkgs,
  lib,
  ...
}:
with lib;

let
  cfg = config.common.optional.mariadb;
in
{

  options.common.optional.mariadb = {
    enable = mkEnableOption "Mariadb Server";
  };

  config = mkIf cfg.enable {

    services.mysql = {
      enable = true;
      package = pkgs.mariadb_114;
    };

  };
}
