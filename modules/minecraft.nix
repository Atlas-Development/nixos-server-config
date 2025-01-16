{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.atlas.services.minecraft-servers;

  serverOpts = types.submodule {
    options = {
      enable = mkEnableOption "Minecraft instance";

      dataDir = mkOption {
        type = types.str;
        description = "Directory containing the server files";
      };

      startScript = mkOption {
        type = types.str;
        default = "start.sh";
        description = "Script to start the instance";
      };

      javaPackage = mkOption {
        type = types.package;
        default = pkgs.jdk21;
        description = "Java package to use";
      };
    };
  };

in
{
  options = {
    atlas.services.minecraft-servers = mkOption {
      type = types.attrsOf serverOpts;
      default = { };
      description = "Minecraft server configurations";
    };
  };

  config = mkIf (cfg != { }) {
    # Create minecraft user and group
    users.groups.minecraft = {};

    users.users.minecraft = {
      group = "minecraft";
      isSystemUser = true;
    };

    # Create systemd services
    systemd.services = mkMerge (
      mapAttrsToList (
        name: serverCfg:
        mkIf serverCfg.enable {
          "minecraft-${name}" = {
            restartIfChanged = false; # Dont restart on config change

            
            description = "Minecraft Instance - ${name}";
            wantedBy = [ "multi-user.target" ];
            after = [ "network.target" ];

            serviceConfig = {
              Type = "simple";
              User = "minecraft";
              Group = "minecraft";
              WorkingDirectory = serverCfg.dataDir;

              Restart = "always";
              RestartSec = "15s";

              StartLimitIntervalSec = "60s";
              StartLimitBurst = "3";

              ExecStart = "${pkgs.screen}/bin/screen -DmS mc-${name} ${serverCfg.startScript}";

              # Use SIGTERM for graceful shutdown
              KillMode = "mixed";
              KillSignal = "SIGTERM";
              TimeoutStopSec = 120;

              ProtectSystem = "full";
              ProtectHome = "true";
              NoNewPrivileges = "true";
              ReadWritePaths = "${serverCfg.dataDir}";
            };
          };
        }
      ) cfg
    );

    # Required packages
    environment.systemPackages = with pkgs; [
      screen
    ];
  };
}
