{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      vscode-langservers-extracted
      cmake-language-server
      lua-language-server
      clang-tools_16
      docker-ls
      stylua
    ];
  };
}
