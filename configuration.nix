{
  config,
  lib,
  pkgs,
  ...
}: {
  services = {
    openssh.enable = true;
    openssh.settings.PermitRootLogin = "yes";
  };

  programs.tmux.enable = true;

  users.users.jelly = {
    isNormalUser = true;
    home = "/home/jelly";
    extraGroups = ["wheel" "networkmanager" "jelly"];
    initialPassword = "password";
  };

  networking.firewall.allowedTCPPorts = [8096];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    dataDir = "/var/lib/jellyfin";
    user = "jelly";
    group = "jelly";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.xserver.xkb.layout = "de";

  system.stateVersion = "25.05";
}
