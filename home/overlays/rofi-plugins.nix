final: prev: {
  rofi-calc = prev.rofi-calc.override {
    rofi-unwrapped = prev.rofi-wayland-unwrapped;
  };
  rofi-emoji = prev.rofi-emoji.override {
    rofi-unwrapped = prev.rofi-wayland-unwrapped;
  };
}
