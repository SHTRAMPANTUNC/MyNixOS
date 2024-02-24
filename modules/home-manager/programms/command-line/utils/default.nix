{ pkgs
, ...
}: {
  imports = [
    ./btop.nix
    ./bat.nix
    ./fzf.nix
    ./eza.nix
    ./ripgrep.nix
  ];

  home.packages = with pkgs; [
    killall
    nitch
    nvtop
    unzip
  ];
}
