{
  pkgs,
  config,
  user,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "jano";
    networkmanager = {enable = true;};
  };

  programs.fish.enable = true;

  system = {
    copySystemConfiguration = false;
  };
}
