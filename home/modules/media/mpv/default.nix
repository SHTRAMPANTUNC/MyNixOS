{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    config = {
      border = false;
      hwdec = "auto";
      gpu-context = "wayland";
      osc = false;
      profile = "gpu-hq";
      vo = "gpu";
    };
    scripts = with pkgs.mpvScripts; [mpris thumbnail sponsorblock];
  };
}
