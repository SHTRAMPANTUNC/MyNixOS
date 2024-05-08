{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.neovim-nightly-overlay.overlay
    inputs.nur.overlay
    (final: prev: {
      rofi-calc = prev.rofi-calc.override {
        rofi-unwrapped = prev.rofi-wayland-unwrapped;
      };
      rofi-emoji = prev.rofi-emoji.override {
        rofi-unwrapped = prev.rofi-wayland-unwrapped;
      };
      prismlauncher = prev.prismlauncher.override {
        jdks = with pkgs; [jdk8 jdk17 jdk19 openjdk21 zulu];
        glfw = pkgs.glfw-wayland-minecraft;
      };
    })
  ];
}
