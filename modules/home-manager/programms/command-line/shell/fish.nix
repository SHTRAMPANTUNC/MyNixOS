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
      vimf = "vim (fzf)";
      tree = "eza --tree -L 3";
      l = "eza --icons -F -H --group-directories-first --git";
      snr =
        "sudo nixos-rebuild --flake /home/kuper/MyFlake#jano switch --upgrade --show-trace";
      nixd = "nix develop --command fish";
      cls = "clear";
      vim = "nvim";
      wg-on = "systemctl start wg-quick-wg0";
      wg-off = "systemctl stop wg-quick-wg0";
    };
  };
}
