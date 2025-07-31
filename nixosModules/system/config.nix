{ lib, config, modulesPath, ... }: {

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  time.timeZone = "Europe/Samara";
  system.stateVersion = "25.11";

}
