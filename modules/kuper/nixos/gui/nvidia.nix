{ ... }:
{
  boot = {
    initrd = {
      kernelModules = [ "nvidia" ];
    };
    kernelParams = [ "nvidia_drm.modeset=1" ];
  };
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      forceFullCompositionPipeline = false;
      open = false;
      nvidiaSettings = true;
    };
  };
}
