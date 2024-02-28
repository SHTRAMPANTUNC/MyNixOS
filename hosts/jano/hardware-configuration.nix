{ config
, lib
, pkgs
, modulesPath
, ...
}:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelModules = [ "kvm-intel" ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d6fb7cca-94e5-4356-8e21-18f9846bd8a1";
      fsType = "ext4";
    };

  fileSystems."/mnt/sda2" =
    {
      device = "/dev/sda2";
      fsType = "ntfs-3g";
      options = [ "rw" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/4A1B-7BA9";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
