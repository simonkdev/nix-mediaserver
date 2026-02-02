{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  tasks = {
    "jfdocker:test" = {
      cwd = "/home/simonkdev/Documents/02-IT/nix-mediaserver";
      exec = ''
        nix-build jellyfin-docker.nix
        docker load < result
        docker run -p 8096:8096 jellyfin-nix:latest
      '';
    };
  };
}
