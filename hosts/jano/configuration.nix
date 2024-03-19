{ pkgs, config, inputs, user, ... }:

{
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "jano";
    networkmanager = { enable = true; };
  };

  environment = {
    variables = {
      SUDO_EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  users = {
    users = {
      ${user} = {
        hashedPasswordFile = config.sops.secrets.password.path;
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" ];
      };
    };
  };
  programs.fish.enable = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };

  system = {
    copySystemConfiguration = false;
    stateVersion = "24.05";
  };
}
