{
  imports = [
    ./base.nix
    ./locale.nix
    ./ssh.nix
    ./sudo.nix
  ];

  config = {
    users.mutableUsers = false;
  };
}
