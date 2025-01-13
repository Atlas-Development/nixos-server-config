{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  users.users.end = {
    isNormalUser = true;
    description = "Endoddo";
    initialHashedPassword = "$6$Wij.Kslb8PRHdrrW$iXgOo.cSHVZnI52x7z.Y1rUbxy/uWHYd5aRu1VUWhEa6IQdfnqo56Itt0iCwmiIoVrXIGP31IWs8zozxLRAtF0";
    extraGroups = [
      "wheel"
    ];
    /*
      wheel: Group that can use sudo
    */

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCUDcj2CCpgnQN+P3rTF9/yzdBpzX0VJcdDwTZPxcaZPaQfur6cNIBQy7TA4Jevp9qF3GIAJAonFOzrIZb8fJ5AVMmwNZmlaTSa2uylsZ4qZO/r/mxD0u6SuYMeClQykH3cMO2wRJrB4gmmfQHEn1RQQZCAX/VvK+5R0XW5k7FZ15OfzKnqYHd/mpqQm404iiQ1WHto6jHI7xQoUo2fDFhH6TAsO0ws2WuOdZAk0DItaRDyE8oxnE6m6Vu60ll3dEFzWDvMMxit00psXWMh/vQgBglP1izM9taouJ1cCMK3vjn4i0N0Q+etQqy26IQyDenoT5hPrG8bq5LJ0RRKIvWvRUjIdWoLkc6zIAno6915J1+1SsKfEcTKa0CkqCRcltL0w8lDwLHWoNCsPHcyUHxGHKl7/wOgk169nzrYbYDBCTsHYBbdOenaF6ly4845os+0aJa94+vfftuCsw3fPXjgkU4f0RynmNJtkgJdFn5/HgwwUUraM8pOpuqS6LZSjBk= end"
    ];
  };
}