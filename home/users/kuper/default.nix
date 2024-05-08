{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlay
      inputs.nur.overlay
      (import ../../overlays/rofi-plugins.nix)
      (import ../../overlays/prismlauncher.nix)
    ];
  };

  home = {
    packages = with pkgs; [
      obsidian
      zathura
      tdesktop
      tun2socks
      prismlauncher
    ];
  };
}
