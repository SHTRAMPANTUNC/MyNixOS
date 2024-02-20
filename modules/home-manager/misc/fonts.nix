{ pkgs
, ...
}: 

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    roboto
    noto-fonts
    noto-fonts-cjk
    font-awesome
    material-icons
    dejavu_fonts
    open-sans
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
