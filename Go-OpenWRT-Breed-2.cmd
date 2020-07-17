@echo off

if "%~1" neq "" (echo %~1) else (goto help)
echo Making bleed firmware with openwrt-%version%
del /q /f openwrt_for_breed.bin >nul
del /q /f ~tempfile >nul
del /q /f ~kernel* >nul
set size=0
for %%I in (%1) do set/A size=4194304-%%~zI
fsutil file createnew ~tempfile %size%
copy /b %1+~tempfile ~kernel
del /q /f ~tempfile >nul
copy /b ~kernel+~kernel ~kernel1

copy /b ~kernel1+%2 openwrt_for_breed_%version%.bin
del /q /f ~kernel* >nul
del %~1
del *mt7621-xiaomi_mir3g-squashfs-rootfs0.bin
exit /B
:help
echo.
echo.This will make OpenWrt binary file for using with Breed for Mi Router 3G.
echo.
echo Usage:
echo Go-OpenWRT-Breed-2.cmd {kernel1 file} {rootfs0 file}
echo.
echo Example: %0
echo %~1
echo.









:: Файл kernel должен иметь размер 4мБ (4 194 304 байт). Поэтому мы берем файл kernel и вычитаем
:: его размер из 4194304 и получаем файл нужный для того чтобы получить kernel + dummy = 4194304


:: for /f %%i in ("openwrt-ramips-mt7621-mir3g-squashfs-kernel1.bin") do ( set /a size = 4194304 - %%~zi >nul )
:: fsutil file createnew dummy2.bin %size% >nul
:: copy /y /b openwrt-ramips-mt7621-mir3g-squashfs-kernel1.bin + /b dummy2.bin + /b openwrt-ramips-mt7621-mir3g-squashfs-rootfs0.bin firmware.bin >nul
:: del dummy2.bin


pause