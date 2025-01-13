{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      ClientAliveInterval = 300; # 5 minutes before sending keepalive
      ClientAliveCountMax = 3; # 15 minutes total before disconnect if no response to keepalive
    };
  };
}
