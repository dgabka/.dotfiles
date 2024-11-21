{...}: {
  fileSystems."/mnt/Seagate" = {
    device = "/dev/disk/by-uuid/61F4-31E6";
    fsType = "exfat";
    options = [
      "rw" # Mount the drive as read-write
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=990" # Set the owner of the mounted drive to the user media
      "gid=987" # Set the group of the mounted drive to the group media
      "fmask=117"
      "dmask=007"
    ];
  };

  fileSystems."/mnt/LEXAR" = {
    device = "/dev/disk/by-uuid/65F4-75D8";
    fsType = "exfat";
    options = [
      "rw" # Mount the drive as read-write
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "uid=990" # Set the owner of the mounted drive to the user media
      "gid=987" # Set the group of the mounted drive to the group media
      "fmask=117"
      "dmask=007"
    ];
  };
}
