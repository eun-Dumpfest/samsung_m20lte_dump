#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):27545600:ee0daac7537957ee5a191ae42c689ebf06eba770; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/BOOT$(getprop ro.boot.slot_suffix):20066304:ef72a1637f9fbd3bcaf5f9c3826629f805634ac0 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY$(getprop ro.boot.slot_suffix):27545600:ee0daac7537957ee5a191ae42c689ebf06eba770 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
