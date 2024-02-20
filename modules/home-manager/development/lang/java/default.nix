{ pkgs
, ...
}:

let
  jdkDir = ".jdks";
in
{
  programs.java = {
    enable = true;
    package = pkgs.temurin-bin-17;
  };

  home.file = with pkgs; {
    "${jdkDir}/8-temurin".source = temurin-bin-8;
    "${jdkDir}/17-temurin".source = temurin-bin-17;
    "${jdkDir}/21-temurin".source = temurin-bin-21;
  };
}
