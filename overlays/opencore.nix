{
  stdenv,
  fetchurl,
  unzip,
  fetchFromGitHub,
  ...
}:
stdenv.mkDerivation rec {
  pname = "opencore";
  version = "0.9.6";

  src = fetchurl rec {
    url = "https://github.com/acidanthera/OpenCorePkg/releases/download/${version}/OpenCore-${version}-RELEASE.zip";
    hash = "sha256-biKbC6GuIagv/IhagwnHyG/nGJHoDXfe0ztAKNm6Log=";
  };

  bdata = fetchFromGitHub {
    owner = "acidanthera";
    repo = "OcBinaryData";
    rev = "4e7e1b7465aae297d706afe5de5c4d1572d86917";
    hash = "sha256-TIIHa74LJB3vNUJNH/j2yuPJPMo+yYQD/EklzefksZ8=";
  };

  dontUnpack = true;

  nativeBuildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/ocpkg
    mkdir -p $out/ocbinaryData
    ${unzip}/bin/unzip $src -d $out/ocpkg
    cp -r $bdata/* $out/ocbinaryData
  '';
}
