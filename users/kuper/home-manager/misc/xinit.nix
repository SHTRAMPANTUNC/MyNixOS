{
  home.file.".xinitrc".text = ''
    #!/usr/bin/env bash
    exec awesome
  '';
  home.file.".xsession".text = ''
    #!/usr/bin/env bash
    exec awesome
  '';
}
