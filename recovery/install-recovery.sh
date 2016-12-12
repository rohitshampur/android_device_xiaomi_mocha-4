#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11171840 f42116006489bf6c261e0c8ab14b46fb0bb27e5d 8634368 a132f7900ebc7de0fa7404316d06bbd75097525a
fi

if ! applypatch -c EMMC:/dev/block/platform/sdhci-tegra.3/by-name/recovery:11171840:f42116006489bf6c261e0c8ab14b46fb0bb27e5d; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sdhci-tegra.3/by-name/boot:8634368:a132f7900ebc7de0fa7404316d06bbd75097525a EMMC:/dev/block/platform/sdhci-tegra.3/by-name/recovery f42116006489bf6c261e0c8ab14b46fb0bb27e5d 11171840 a132f7900ebc7de0fa7404316d06bbd75097525a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
