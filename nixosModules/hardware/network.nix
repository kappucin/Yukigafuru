{ lib, ... }: {

    networking = {
      hostName = "sunofureku";
      networkmanager.enable = true;
      useDHCP = lib.mkDefault true;
    };

}
