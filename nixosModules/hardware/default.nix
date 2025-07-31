{

  imports = [
    ./bluetooth.nix
    ./graphics.nix
    ./network.nix
    ./audio.nix
  ];

  services.udev = {
    enable = true;
  };

}
