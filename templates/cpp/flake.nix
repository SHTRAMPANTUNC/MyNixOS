{
  description = "C/C++ Template";

  inputs = {
    nixpkgs.url = "nixpkgs";
    systems.url = "github:nix-systems/x86_64-linux";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      pname = "some_name"; 
      version = "0.1.0";
      src = ./.;
      buildInputs = with pkgs; [
        zlib
      ];
      nativeBuildInputs = with pkgs; [
        gcc
        gdb
        cmake
        ninja
        pkg-config
        clang-tools
        cmake-language-server
      ];
    in
    {
      devShells.default = pkgs.mkShell {
        inherit buildInputs nativeBuildInputs;
        NIX_CFLAGS_COMPILE = "-g";
      };
      packages.default = pkgs.stdenv.mkDerivation {
        inherit buildInputs nativeBuildInputs pname version src;
          buildPhase = ''
            cmake --build .
        '';
          installPhase = ''
            mkdir -p $out
            cp -r . $out
        '';
      };
    });
}
