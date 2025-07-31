{ pkgs , ... }: {

  environment.systemPackages = with pkgs; [
     wget
     git
     fastfetch
     tree
  ];

}
