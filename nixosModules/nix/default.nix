{ lib, ... }: {

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "rar"

      "nvidia-x11"
      "nvidia-settings"
    ];
  };

}
