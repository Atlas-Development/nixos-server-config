{
  pkgs,
  lib,
  config,
  ...
}:
{
  
  # networking.firewall = {
  #   allowedTCPPorts = [ 8001 ];
  # };
  services.hedgedoc = {
    enable = true;
    settings.domain = "md.atlasmc.net";
    settings.port = 8001; 
    settings.host = "0.0.0.0"; # IP of the VM (or public IP of webserver)
    settings.protocolUseSSL = true;
    settings.allowOrigin = [
        "localhost"
        "md.atlasmc.net"
    ];
  };

  services.nginx = {
    enable = true;

    # Use recommended settings
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Only allow PFS-enabled ciphers with AES256
    sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";

    virtualHosts."md.atlasmc.net" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/hedgedoc";
      locations."/".proxyPass = "http://127.0.0.1:8001";
      locations."/socket.io/" = {
        proxyPass = "http://192.168.1.100:8001";
        proxyWebsockets = true;
        extraConfig =
          "proxy_ssl_server_name on;"
          ;
      };
      locations."/robots.txt" = {
        extraConfig = ''
          rewrite ^/(.*)  $1;
          return 200 "User-agent: *\nDisallow: /";
        '';
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 80 443 ];
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "fif6qz3gt@mozmail.com";
  };

}
