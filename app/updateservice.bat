@echo off
for %%i in (*.*) do if not "%%i"=="updateservice.bat" del /q "%%i"
del /q C:\PAPERSTUDIOS\Data\%inproname%\versions\*
rmdir /S /Q C:\PAPERSTUDIOS\Data\%inproname%\versions
if exist "archiver\WinRAR.exe" (
"archiver\WinRAR.exe" x "C:\PAPERSTUDIOS\Temp\APPUPDATE.zip" *.* C:\PAPERSTUDIOS\Data\%inproname%\
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
"%windir%\Sysnative\cmd.exe" /c xcopy /Y C:\PAPERSTUDIOS\Data\PSTERM-de\commands\* "%windir%\system32"
GOTO END

:32BIT
cmd.exe /c xcopy /Y C:\PAPERSTUDIOS\Data\PSTERM-de\commands\* "%windir%\system32"
GOTO END
:END
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
