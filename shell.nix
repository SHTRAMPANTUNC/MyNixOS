{ pkgs, ... }:
pkgs.mkShell
{
  packages = with pkgs;
    [
      alejandra
      deadnix
      nil
    ];

  name = "ღვინო";
  meta.description = "The default development shell for this flake";

  shellHook = '' 
    clear
    echo "
        ________    ___    __ __ ______
       / ____/ /   /   |  / //_// ____/
      / /_  / /   / /| | / ,<  / __/   
     / __/ / /___/ ___ |/ /| |/ /___   
    /_/   /_____/_/  |_/_/ |_/_____/   
  "  
  '';
  formatter = pkgs.alejandra;
}
