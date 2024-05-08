final: prev: {
  prismlauncher = prev.prismlauncher.override {
    jdks = with prev; [jdk8 jdk17 jdk19 openjdk21 zulu];
    glfw = prev.glfw-wayland-minecraft;
  };
}
