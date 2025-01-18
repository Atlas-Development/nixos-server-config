{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];

  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  environment.systemPackages = with pkgs; [
    tmux
  ];

}
