{
  pkgs,
  ...
}: {
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-eco gh-dash];
    gitCredentialHelper.enable = false;
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
      key = "D102F2DEE0F857EA307BE46D0FA34C527601B4CC";
      signByDefault = true;
    };
    extraConfig = {
      init = {defaultbranch = "main";};
      branch = {sort = "-committerdate";};
      pull = {rebase = true;};
      push = {default = "simple";};
    };
    ignores = [
      # c commons
      "compile_commands.json"
      "vgcore.*"
      ".cache"
      "*.gc??"
      # locked files
      "*~"
      # nix buid
      "result"
      # ide folders
      ".editorconfig"
      ".vscode"
      ".idea"
      ".vs"
    ];
  };
}
