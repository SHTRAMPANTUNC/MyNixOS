{pkgs, ...}: {
  imports = [./btop.nix ./bat.nix ./fzf.nix ./eza.nix ./zoxide.nix ./ripgrep.nix];

  home.packages = with pkgs; [killall nvtopPackages.amd unzip];
}
