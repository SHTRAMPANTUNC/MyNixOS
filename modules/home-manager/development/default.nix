{ pkgs, ... }: {

  imports = [
    ./lang
    ./nvim
  ];

  home.packages = with pkgs; [
    # some tools
    ninja
    gdb
  ];
}
