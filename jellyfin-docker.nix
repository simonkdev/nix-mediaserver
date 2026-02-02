{pkgs ? import <nixpkgs> {}}:
pkgs.dockerTools.buildImage {
  name = "jellyfin-nix";
  tag = "latest";

  contents = [
    pkgs.bash
    pkgs.coreutils
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  config = {
    ExposedPorts = {
      "8096" = {};
    };

    Cmd = [
      "${pkgs.jellyfin}/bin/jellyfin"
      "--datadir"
      "/config"
      "--cachedir"
      "/cache"
      "--service"
    ];
  };
}
