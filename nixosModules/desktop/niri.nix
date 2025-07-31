{ pkgs, ... }: {

   environment.systemPackages = with pkgs; [
     alacritty
   ];

   programs.niri.enable = true;

}
