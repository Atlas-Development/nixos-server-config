{ lib, ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
    ];
    defaultGateway = "152.53.120.1";
    defaultGateway6 = {
      address = "fe80::1";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          {
            address = "152.53.121.26";
            prefixLength = 22;
          }
        ];
        ipv6.addresses = [
          {
            address = "2a0a:4cc0:c0:449c::1";
            prefixLength = 64;
          }
        ];
        ipv4.routes = [
          {
            address = "152.53.120.1";
            prefixLength = 32;
          }
        ];
        ipv6.routes = [
          {
            address = "fe80::1";
            prefixLength = 128;
          }
        ];
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="86:10:43:6d:05:5b", NAME="eth0"

  '';
}
