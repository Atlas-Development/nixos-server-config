{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  users.users.xaver106 = {
    isNormalUser = true;
    description = "Xaver106";
    initialHashedPassword = "$y$j9T$CBdwPc0ywLZO4w1wsrFZu/$lqX9iLC3cJoIA0xV8y/cCnl9jBczDmnrnTWqUAiq1N/";
    extraGroups = [
      "wheel"
    ];
    /*
      wheel: Group that can use sudo
    */
    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICJlknbHYyWhwgZdScx0WCkqZy8kEXvqL/QefCJQRysP xaver106"
    ];
  };

  programs.fish.enable = true;
}