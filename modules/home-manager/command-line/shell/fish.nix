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
      fzf = "fzf --border --preview 'bat --color=always {}' --prompt 'Files> '";
      vimf = "vim (fzf)";
      tree = "eza --tree -L 3";
      l = "eza --icons -F -H --group-directories-first --git";
      snr = "sudo nixos-rebuild --flake /etc/nixos switch";
      cls = "clear";
      vim = "nvim";
      f = "feh -g 1920x1080 -d -S filename";
      w-on = "wg-quick up $HOME/.kupr_desktop.conf";
      w-off = "wg-quick down $HOME/.kupr_desktop.conf";
    };
  };
}
