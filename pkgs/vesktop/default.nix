{
  lib,
  stdenv,
  stdenvNoCC,
  gcc13Stdenv,
  fetchFromGitHub,
  substituteAll,
  makeWrapper,
  makeDesktopItem,
  copyDesktopItems,
  vencord,
  electron_27,
  pipewire,
  libpulseaudio,
  libicns,
  libnotify,
  jq,
  moreutils,
  nodePackages,
  cacert,
  pkgs,
}: let
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = fetchFromGitHub {
      owner = "Vendicated";
      repo = "Vencord";
      rev = "v1.7.4";
      hash = "sha256-Ub8VzeTkka0oq0CYN/UHjOIH2y3F7Oy9QZpTi6glehI=";
    };
  });
in
  stdenv.mkDerivation rec {
    pname = "vesktop";
    version = "1.5.1";

    src = fetchFromGitHub {
      owner = "kaitlynkittyy"; #"Vencord";
      repo = "Vesktop";
      rev = "ae9b4b52cf2d784fa8f68a526855ad4ebafe8784"; #"v${version}";
      hash = "sha256-KbIWk2p/mxzyv1ovLHZ3d3+FtaTWwLnnyGEigcw2ts4="; #"sha256-OyAGzlwwdEKBbJJ7h3glwd/THy2VvUn/kA/Df3arWQU=";
    };

    pnpmDeps = assert lib.versionAtLeast nodePackages.pnpm.version "8.10.0";
      stdenvNoCC.mkDerivation {
        pname = "${pname}-pnpm-deps";
        inherit src version patches ELECTRON_SKIP_BINARY_DOWNLOAD;

        nativeBuildInputs = [
          jq
          moreutils
          nodePackages.pnpm
          cacert
        ];

        pnpmPatch = builtins.toJSON {
          pnpm.supportedArchitectures = {
            os = ["linux"];
            cpu = ["x64" "arm64"];
          };
        };

        postPatch = ''
          mv package.json package.json.orig
          jq --raw-output ". * $pnpmPatch" package.json.orig > package.json
        '';

        installPhase = ''
          export HOME=$(mktemp -d)

          pnpm config set store-dir $out
          pnpm install --frozen-lockfile --ignore-script

          rm -rf $out/v3/tmp
          for f in $(find $out -name "*.json"); do
            sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
            jq --sort-keys . $f | sponge $f
          done
        '';

        dontBuild = true;
        dontFixup = true;
        outputHashMode = "recursive";
        outputHash = "sha256-JLjJZYFMH4YoIFuyXbGUp6lIy+VlYZtmwk2+oUwtTxQ=";
      };

    nativeBuildInputs = [
      copyDesktopItems
      nodePackages.pnpm
      nodePackages.nodejs
      makeWrapper
    ];

    patches = [
      (substituteAll {
        inherit vencord;
        src = ./use_system_vencord.patch;
      })
    ];

    ELECTRON_SKIP_BINARY_DOWNLOAD = 1;

    preBuild = ''
      export HOME=$(mktemp -d)
      export STORE_PATH=$(mktemp -d)

      cp -Tr "$pnpmDeps" "$STORE_PATH"
      chmod -R +w "$STORE_PATH"

      pnpm config set store-dir "$STORE_PATH"
      pnpm install --offline --frozen-lockfile --ignore-script
      patchShebangs node_modules/{*,.*}
    '';

    postBuild = ''
      pnpm build
      # using `pnpm exec` here apparently makes it ignore ELECTRON_SKIP_BINARY_DOWNLOAD
      ./node_modules/.bin/electron-builder \
        --dir \
        -c.electronDist=${electron_27}/libexec/electron \
        -c.electronVersion=${electron_27.version}
    '';

    # this is consistent with other nixpkgs electron packages and upstream, as far as I am aware
    installPhase = let
      # this is mainly required for venmic
      libPath = lib.makeLibraryPath [
        libpulseaudio
        libnotify
        pipewire
        stdenv.cc.cc.lib
      ];
    in ''
      runHook preInstall

      mkdir -p $out/opt/Vesktop/resources
      cp dist/linux-*unpacked/resources/app.asar $out/opt/Vesktop/resources

      pushd build
      ${libicns}/bin/icns2png -x icon.icns
      for file in icon_*x32.png; do
        file_suffix=''${file//icon_}
        install -Dm0644 $file $out/share/icons/hicolor/''${file_suffix//x32.png}/apps/vesktop.png
      done

      makeWrapper ${electron_27}/bin/electron $out/bin/vesktop \
        --prefix LD_LIBRARY_PATH : ${libPath} \
        --add-flags $out/opt/Vesktop/resources/app.asar \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}"

      runHook postInstall
    '';

    desktopItems = [
      (makeDesktopItem {
        name = "vesktop";
        desktopName = "Vesktop";
        exec = "vesktop %U";
        icon = "vesktop";
        startupWMClass = "Vesktop";
        genericName = "Internet Messenger";
        keywords = ["discord" "vencord" "electron" "chat"];
        categories = ["Network" "InstantMessaging" "Chat"];
      })
    ];

    passthru = {
      inherit pnpmDeps;
    };
  }
