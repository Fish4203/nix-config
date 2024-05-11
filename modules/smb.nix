{ 
  pkgs,
  ...
}: {
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/media-server" = {
    device = "//192.168.20.69";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

      in ["${automount_opts},credentials=/etc/smba/media-secrets,uid=1000,gid=100"];
  };

}
