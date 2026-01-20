{
  launchd.user.agents.docker-desktop = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/open"
        "-a"
        "Docker.app"
      ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };
}
