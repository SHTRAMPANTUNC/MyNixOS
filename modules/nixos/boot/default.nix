{ ... }:
{
  imports = [
    ./theme.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        gfxmodeEfi = "2560x1440x64";
      };
    };
  };
}
