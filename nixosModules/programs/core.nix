{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gcc
    inxi
    pciutils
    smartmontools
    usbutils
  ];

}
