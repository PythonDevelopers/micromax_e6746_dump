#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:739054a1bb67153443c46af23cc34a13c0db9ac4; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:c886dc856d97354d7cf631fb371bd7e8160f1e64 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:739054a1bb67153443c46af23cc34a13c0db9ac4 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
