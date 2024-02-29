{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      function fish_user_key_bindings
        fish_vi_key_bindings
      end

      if command -q nix-your-shell
        nix-your-shell fish | source
      end
    '';
    shellAliases = {
      vimf = "vim (fzf)";
      tree = "eza --tree -L 3";
      l = "eza --icons -F -H --group-directories-first --git";
      snr = "sudo nixos-rebuild --flake /etc/nixos switch";
      cls = "clear";
      vim = "nvim";
      f = "feh -g 1920x1080 -d -S filename";
      wg-on = "systemctl start wg-quick-wg0";
      wg-off = "systemctl stop wg-quick-wg0";
    };
  };
}
