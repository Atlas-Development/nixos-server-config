{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  users.users.quick = {
    isNormalUser = true;
    description = "QuickWrite";
    initialHashedPassword = "";
    extraGroups = [
      "wheel"
    ];
    # wheel: Group that can use sudo

    openssh.authorizedKeys.keys = [
      ""
    ];
  };
}
