#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY:30439424:cf055ef5af4347eb9d0ab30edf100b9984ed1c1c; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/BOOT:21241856:e269cda752ecedf282d5954b0f5644b9f8e8a123 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY:30439424:cf055ef5af4347eb9d0ab30edf100b9984ed1c1c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
