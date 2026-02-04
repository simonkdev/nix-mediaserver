{pkgs ? import <nixpkgs> {}}:
pkgs.dockerTools.buildImage {
  name = "jellyfin-nix";
  tag = "latest";

  fromImage = pkgs.dockerTools.pullImage {
    imageName = "jellyfin/jellyfin";
    imageDigest = "sha256:333b647716631443a43c7fabac4b0c46b4e2f036bad19547e00958f10f721b85";
    hash = "sha256-AnZWcBf+10Fo/9SEV4sO1bMtB0Bv4+tmg2nCs7F7uTM=";
    finalImageName = "jellyfin/jellyfin";
    finalImageTag = "latest";
  };

  # contents = [
  #   pkgs.bash
  #   pkgs.stdenv.cc.cc.lib
  # ];

  # config = {
  #   ExposedPorts = {
  #     "8096" = {};
  #   };

  #   Cmd = [
  #     "${pkgs.bash}/bin/bash"
  #     "${pkgs.jellyfin}/bin/jellyfin--datadir /config --cachedir /cache --service"
  #   ];
  # };
}
