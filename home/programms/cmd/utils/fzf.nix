{...}: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    defaultOptions = ["--border" "--preview 'bat --color=always {}'" "--prompt 'Files> '"];
  };
}
