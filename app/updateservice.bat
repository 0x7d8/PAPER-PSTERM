@echo off
for %%i in (*.*) do if not "%%i"=="updateservice.bat" del /q "%%i"
del /q C:\PAPERSTUDIOS\Data\%inproname%\commands\*
del /q C:\PAPERSTUDIOS\Data\%inproname%\versions\*
rmdir /S /Q C:\PAPERSTUDIOS\Data\%inproname%\versions
rmdir /S /Q C:\PAPERSTUDIOS\Data\%inproname%\commands
if exist "archiver\WinRAR.exe" (
"archiver\WinRAR.exe" x "C:\PAPERSTUDIOS\Temp\APPUPDATE.zip" *.* C:\PAPERSTUDIOS\Data\%inproname%\
cls
echo.
echo  [!] FERTIG
pause
boot.bat
) else (
:error
cls
echo  [i] AN ERROR HAS OCCURED
echo      ERROR: WinRar not found
echo.
echo  [i] PLEASE REINSTALL THE APP
echo      github.com/rotvproHD/%gitname%
pause
goto error
)
