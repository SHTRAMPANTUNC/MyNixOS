{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      excludePackages = [ pkgs.xterm ];
      xkb = {
        layout = "us,ru";
        options = "caps:none, grp:alt_shift_toggle";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xclip
    maim
    feh
    dbus-broker
  ];
}
