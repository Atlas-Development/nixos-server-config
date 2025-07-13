{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  users.users.gamecrash = {
    isNormalUser = true;
    description = "gamecrash";
    initialHashedPassword = "$y$j9T$ePgwJlPnuey8Db52wOqWT/$VzhE0qf8WPlHBP9BsM.CSE1n8PgA0X4wZD3epetGWTC";
    extraGroups = [
      "wheel"
      "minecraft"
    ];
    /*
      wheel: Group that can use sudo
      minecraft: Acces to minecraft server files and tmux console
    */

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPfM/ZdGVdk64ZYxbAQxix8AJQa2aGEZ0xcNYXtZmIqu game.crash"
    ];
  };
}
