{ 
  pkgs,
  ...
}: {
  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/media" = {
    device = "//192.168.20.69/media";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/samba/media-secrets"];
  };
  fileSystems."/mnt/personal" = {
    device = "//192.168.20.69/personal";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/samba/media-secrets"];
  };
  fileSystems."/mnt/family" = {
    device = "//192.168.20.69/family";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/samba/media-secrets"];
  };

}
