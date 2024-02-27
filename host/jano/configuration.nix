{ pkgs
, root
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

  # IDK where to put this
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
  ];

  environment.variables = {
    SUDO_EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  users = {
    users = {
      ${user} = {
        hashedPasswordFile = "${root}/secrets/passwd.nix";
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
