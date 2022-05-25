#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):28092416:0a2fdf36d64b5a62765c207f1b3d1dfb9ce09eb6; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/BOOT$(getprop ro.boot.slot_suffix):20066304:f4a60afbb1a1e2df87291428f4ff0536905316db \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):28092416:0a2fdf36d64b5a62765c207f1b3d1dfb9ce09eb6 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
