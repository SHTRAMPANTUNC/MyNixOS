{pkgs, ...}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
      extraPackages = with pkgs; [libva vaapiVdpau libvdpau-va-gl];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  services = {xserver = {videoDrivers = ["radeon" "amdgpu"];};};
}
