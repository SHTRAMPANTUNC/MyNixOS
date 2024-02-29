{ pkgs
, config
, inputs
, user
, ...
}:

{

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "jano";
    networkmanager = {
      enable = true;
    };
  };

    environment.variables = {
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  users = {
    users = {
      ${user} = {
        hashedPasswordFile = config.sops.secrets.password.path;
        initialPassword = "password";
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [ "wheel" "networkmanager" "audio" "video" "docker" ];
      };
    };
  };
  programs.fish.enable = true;

  system = {
    copySystemConfiguration = false;
    stateVersion = "24.05";
  };
}
