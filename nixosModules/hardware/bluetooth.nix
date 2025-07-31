{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    blueman
    bluez
    bluez-tools
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services = {
    blueman.enable = true;
  };

}
