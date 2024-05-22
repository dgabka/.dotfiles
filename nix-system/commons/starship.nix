{
  enable = true;
  enableZshIntegration = true;
  enableBashIntegration = true;
  settings = {
    add_newline = true;
    aws.disabled = true;
    command_timeout = 5000;
    docker_context.disabled = true;
    nix_shell = {
      style = "blue";
      heuristic = true;
    };
  };
}
