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
    settings = {
      domain = "md.atlasmc.net";
      port = 8001; 
      host = "0.0.0.0"; # IP of the VM (or public IP of webserver)
      protocolUseSSL = true;
      allowOrigin = [
          "localhost"
          "md.atlasmc.net"
      ];

      allowEmailRegister = false;
      allowAnonymous = false;
      allowAnonymousEdits = true;
    };
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
        proxyPass = "http://127.0.0.1:8001";
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

  environment.systemPackages = with pkgs; [
    hedgedoc
  ];

  /*
    To manage users locally use:
    $ sudo CMD_CONFIG_FILE=/run/hedgedoc/config.json NODE_ENV=production manage_users
  */

}
