{ ... }:
{
  nixpkgs = {
    config = {
      allowUnfreePredicate = _: true;
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };
}
