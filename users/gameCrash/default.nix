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
    description = "game.crash";
    initialHashedPassword = "$2y$10$E8VhrejyP5YigEZPofPdwuAo7VxkstCVZuIK8VkpfafzvAGAnT8Ii";
    extraGroups = [
      "wheel"
    ];
    # wheel: Group that can use sudo

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFdValBr4oOxFuGBRGx5RBYZnZmeSR4CcaIr6dUTyXVM game.crash"
    ];
  };
}
