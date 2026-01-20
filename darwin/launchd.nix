{
  launchd.user.agents.docker-desktop = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-aj"
        "Docker.app"
      ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
