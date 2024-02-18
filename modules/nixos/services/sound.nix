{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];

  services.pipewire =
    {
      lowLatency = {
        enable = true;
        quantum = 60;
        rate = 48000;
      };
    };

  security.rtkit.enable = true;
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pamixer
    pavucontrol
    pulseaudio
  ];
}
