{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
    playerctl
    wireplumber
  ];

  security.rtkit = {
    enable = true;
  };

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
