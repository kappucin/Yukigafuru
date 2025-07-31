{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dua
    p7zip
    rar
    unzip
    zip
  ];

}
