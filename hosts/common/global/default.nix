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

    nix = {
      settings = {
        auto-optimise-store = true; # Try to reduce size of nix Store
        experimental-features = [
          "nix-command"
          "flakes"
        ]; # Enable Flakes and the nix Command
      };
    };
  };
}
