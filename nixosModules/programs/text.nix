{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    fd
    jq
    sd
  ];

}
