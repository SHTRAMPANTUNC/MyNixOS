{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [ delve go gotests gotools impl revive ];

    sessionVariables = rec {
      GOPATH = "${config.xdg.dataHome}/go";
      GOBIN = "${GOPATH}/bin";
    };
  };
}
