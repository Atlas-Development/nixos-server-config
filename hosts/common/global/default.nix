{
  imports = [
    ./base.nix
    ./locale.nix
    ./ssh.nix
    ./sudo.nix
    ./minecraft.nix
  ];

  config = {
    environment.enableAllTerminfo = true;
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "24.11";
  };
}
