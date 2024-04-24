{
  description = "Example C++ development environment for {some project}";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2305.491812.tar.gz";
  };

  outputs = { self, nixpkgs }:
    let
      allSystems = [
        "x86_64-linux" 
        "aarch64-linux" 
        "x86_64-darwin" 
        "aarch64-darwin"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            clang_tools_16
            cmake
            ninja
            boost
            gcc
            gdb
          ];
        };
      });
    };
}
