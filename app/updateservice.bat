@echo off
cls
echo.
echo  [i] DIE UPDATE DATEIEN WERDEN HERUNTERGELADEN,
echo      BITTE WARTEN SIE EINEN MOMENT.
PING localhost -n 6 >NUL
call internet.cmd https://github.com/rotvproHD/PAPER-PSTERM/raw/main/app/APPFILES.zip -saveTo C:\PAPERSTUDIOS\Temp\APPUPDATE.zip
for %%i in (*.*) do if not "%%i"=="updateservice.bat" del /q "%%i"
cls
echo.
echo  [i] ES IST AM BESTEN, WENN SIE IMMER DIE
echo      NEUSTE VERSION UNSERER SOFTWARE BESITZEN
PING localhost -n 6 >NUL
del /q C:\PAPERSTUDIOS\Data\%inproname%\commands\*
del /q C:\PAPERSTUDIOS\Data\%inproname%\versions\*
rmdir /S /Q C:\PAPERSTUDIOS\Data\%inproname%\versions
rmdir /S /Q C:\PAPERSTUDIOS\Data\%inproname%\commands
cls
echo.
echo  [i] FALLS FEHLER IN DER NEUEN VERSION AUFTRETEN,
echo      KOENNEN SIE DIE IN UPAAI UNTER FORMS MELDEN
PING localhost -n 6 >NUL
if exist "archiver\WinRAR.exe" (
"archiver\WinRAR.exe" x "C:\PAPERSTUDIOS\Temp\APPUPDATE.zip" *.* C:\PAPERSTUDIOS\Data\%inproname%\
cls
echo.
echo  [i] DAS UPDATE IST FAST FERTIG INSTALLIERT,
echo      NUR NOCH WENIGE MOMENTE
PING localhost -n 6 >NUL
cls
echo.
echo  [i] DAS UPDATE WURDE INSTALLIERT,
echo      HERZLICHEN GLUECKWUNSCH.
echo.
pause
cls
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
