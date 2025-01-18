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
    ./networking.nix # generated at runtime by nixos-infect
  ];

  config = {

    networking.hostName = "atlasmc-test";
    boot.tmp.cleanOnBoot = true;
    zramSwap.enable = true;
    networking.domain = "";

    atlas.optional.minecraft.enable = true;

    services.minecraft-servers = {
      enable = true;
      eula = true;
      servers = {
        "test" = {
          enable = true;
          autoStart = false;
          openFirewall = true;
          package = pkgs.vanillaServers.vanilla-1_21_4;
          jvmOpts = "-Xms2048M -Xmx2048M --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20";
        };
      };
    };
    
  };
}
