{
  imports = [
    ./base.nix
    ./locale.nix
    ./ssh.nix
    ./sudo.nix
  ];

  config = {
    environment.enableAllTerminfo = true;
    system.stateVersion = "24.11";
  };
}
