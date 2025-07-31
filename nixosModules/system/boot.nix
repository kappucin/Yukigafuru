{ pkgs, ... }: {

   boot = {
     initrd = {
       availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
       kernelModules = [ ];
     };
     kernelModules = [ "kvm-intel" ];
     extraModulePackages = [ ];
     loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
     };

     kernelPackages = pkgs.linuxPackages_latest;

   };

}
