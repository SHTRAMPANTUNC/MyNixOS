{ pkgs, ... }:

{
  home.file.".clang-format".text = ''
    BasedOnStyle: LLVM
    TabWidth: 4
    IndentWidth: 4
    ColumnLimit: 90
    UseTab: ForIndentation
    SortIncludes: true
  '';
}
