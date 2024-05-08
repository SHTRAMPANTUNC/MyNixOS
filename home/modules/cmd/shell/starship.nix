{
  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        format = ''

          [ ](bold white)$hostname$kubernetes$directory$git_branch$git_commit$git_state$git_status$docker_context$package$golang$helm$java$cmake$julia$kotlin$lua$nim$nodejs$python$ruby$rust$swift$terraform$aws$gcloud$azure$nix_shell            
          [ ➜ ](bold green)'';

        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          format = "[$hostname]($style) ";
          style = "blue bold";
          trim_at = ".";
          disabled = false;
        };
        nix_shell = {symbol = " ";};
        golang = {
          style = "blue";
          symbol = " ";
        };
        lua = {symbol = " ";};
        cmake = {
          style = "green";
          symbol = "△ ";
        };
        git_branch = {symbol = " ";};
        rust = {symbol = " ";};
        nodejs = {symbol = " ";};
        docker_context = {symbol = " ";};

        git_status = {
          conflicted = "🏳 ";
          untracked = "🤷";
          stashed = "📦";
          modified = "📝";
          renamed = "👅";
          deleted = "🗑 ";
        };
        directory = {
          read_only = " ";
          truncation_length = 7;
          truncation_symbol = "…/";
        };
      };
    };
  };
}
