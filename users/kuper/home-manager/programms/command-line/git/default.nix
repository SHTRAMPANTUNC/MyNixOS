{ pkgs
, gitsignbydefault
, ...
}: {

  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-eco gh-dash ];
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
    signing = {
      key = "1B36B377A5B525968A34ACBFD0DEC6102198D067";
      signByDefault = true;
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
