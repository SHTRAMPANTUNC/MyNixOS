{pkgs, ...}: {
  imports = [./media ./browser ./cmd ./discord ./nvim];

  home.packages = with pkgs; [
    obsidian
    zathura
    tdesktop
    tun2socks
    prismlauncher
  ];
}
