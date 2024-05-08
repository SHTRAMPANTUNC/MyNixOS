{
  config,
  ...
}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = config.sops.secrets.gh_key.path;
      };
    };
  };
}
