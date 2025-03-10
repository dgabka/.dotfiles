{
  enable = true;
  enableZshIntegration = true;
  enableBashIntegration = true;
  enableFishIntegration = true;
  settings = {
    add_newline = true;
    aws.disabled = true;
    command_timeout = 5000;
    docker_context.disabled = true;
    nix_shell = {
      symbol = "❄️";
      format = "via [$symbol$name]($style) ";
      style = "blue";
      heuristic = true;
    };
  };
}
