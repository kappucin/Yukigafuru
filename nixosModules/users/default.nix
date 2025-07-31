{ pkgs, ... }: {

  users = {
    users.kppcn = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.nushell;
    };
  };

}
