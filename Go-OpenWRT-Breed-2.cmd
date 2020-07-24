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

pause
