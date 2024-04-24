{
  user,
  pkgs,
  ...
}: {
  users = {
    users = {
      ${user} = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = ["wheel" "networkmanager" "audio" "video" "docker"];
      };
    };
  };
}
