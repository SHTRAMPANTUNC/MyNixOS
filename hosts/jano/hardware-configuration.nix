{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  boot.initrd.availableKernelModules = ["vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
  boot.kernelModules = ["kvm-intel"];
  boot.supportedFilesystems = ["ntfs"];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1c28d89a-9e1e-4765-aa69-5e3e71696b61";
    fsType = "ext4";
  };

  fileSystems."/mnt/sda2" = {
    device = "/dev/sda2";
    fsType = "ntfs-3g";
    options = ["rw"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F9EB-A7BD";
    fsType = "vfat";
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
