{ pkgs
, gitsignbydefault
, ...
}: {

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;
    userName = "SHTRAMPANTUNC";
    userEmail = "youngtuctim@gmail.com";
    aliases = {
      fpush = "push --force-with-lease";
      aa = "add --all";
      cm = "commit -m";
      co = "checkout";
      br = "branch";
      s = "status";
      uncommit = "reset --soft head^";
      unadd = "reset";
    };
    extraConfig = {
      init = {
        defaultbranch = "main";
      };
      branch = {
        sort = "-committerdate";
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "simple";
      };
    };
    ignores = [
      # c commons
      ".cache"
      "compile_commands.json"
      "*.gc??"
      "vgcore.*"
      # locked files
      "*~"
      # nix buid
      "result"
      # ide folders
      ".idea"
      ".vscode"
      ".vs"
    ];
  };
}
