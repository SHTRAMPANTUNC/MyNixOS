{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      function fish_user_key_bindings
        fish_vi_key_bindings
      end

    '';
    shellAliases = {
      tree = "eza --tree -L 3";
      l = "eza --icons -F -H --group-directories-first --git";
      cls = "clear";
    };
  };
}
