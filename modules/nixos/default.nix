{...}: {
  imports = [
    ./hypr
    ./config
    ./services
    ./sops.nix
    ./steam.nix
    ./gpu.nix
    ./qmk.nix
    ./vpn.nix
    ./grub.nix
  ];
}
