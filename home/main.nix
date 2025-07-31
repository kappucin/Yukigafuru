{ config, pkgs, ... }: {

  imports = [
    ./system/shell.nix
    ./desktop/niri.nix
    ./desktop/rofi.nix
  ];

  home.username = "kppcn";
  home.homeDirectory = "/home/kppcn";

  home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    userName  = "kappucin";
    userEmail = "stepankluzev01@gmail.com";
  };

}
