
:: https://4pda.ru/forum/index.php?s=&showtopic=837667&view=findpost&p=76121038

SET version=19.07.3
echo version is %version%
wget.exe https://downloads.openwrt.org/releases/%version%/targets/ramips/mt7621/openwrt-%version%-ramips-mt7621-xiaomi_mir3g-squashfs-kernel1.bin
wget.exe https://downloads.openwrt.org/releases/%version%/targets/ramips/mt7621/openwrt-%version%-ramips-mt7621-xiaomi_mir3g-squashfs-rootfs0.bin

Go-OpenWRT-Breed-2.cmd openwrt-%version%-ramips-mt7621-xiaomi_mir3g-squashfs-kernel1.bin openwrt-%version%-ramips-mt7621-xiaomi_mir3g-squashfs-rootfs0.bin

pause
