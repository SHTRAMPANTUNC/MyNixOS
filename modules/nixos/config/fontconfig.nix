{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrainsMono"];
        serif = ["Noto Serif"];
        sansSerif = ["Inter"];
      };
    };
    packages = with pkgs; [
      roboto
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      font-awesome
      material-icons
      dejavu_fonts
      open-sans
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };
}
