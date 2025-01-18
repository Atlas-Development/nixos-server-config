{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;

let
  cfg = config.atlas.optional.minecraft;
in
{

  options.atlas.optional.minecraft = {
    enable = mkEnableOption "Minecraft Server Modules";
  };

  config = mkIf cfg.enable {

    inputs = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];

    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  };
}
