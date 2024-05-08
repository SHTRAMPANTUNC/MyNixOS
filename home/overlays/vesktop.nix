{pkgs, ...}:
(pkgs.vesktop.override {
  vencord = pkgs.vencord.overrideAttrs (old: {
    src = old.src.override {
      rev = "v1.7.8";
      hash = "sha256-5kMBUdFupVxmlQ7NVJ7qzFoyQieDGHrFNkrzhlhEzJ0=";
    };
  });
})
.overrideAttrs (oldAttrs: rec {
  version = "1.5.2";
  src = oldAttrs.src.override {
    rev = "8eaa5206b98ce7029b6879cc2ce361c2ae5f6239";
    hash = "sha256-k/k5mZpfIrThVwgzB4OgL6txfnWMQ2e7uAXO763PnLM=";
  };

  pnpmDeps = oldAttrs.pnpmDeps.overrideAttrs (oldAttrs2: {
    outputHash = "sha256-XgIkfPgtuII8hbt2fRNeNZpxhVaxhacw2UvC9tFA1HU=";
  });
})
