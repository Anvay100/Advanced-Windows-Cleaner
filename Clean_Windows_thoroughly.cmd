@echo off
title Advanced Windows Cleaner
echo.
echo -------------------------
echo Advanced Windows Cleaner
echo -------------------------
echo.
echo Please connect to internet while we clean your system.
echo This might take several hours depending on your PC's internet connection and PC's speed
echo.
echo Step 1: Scanning PC Health...
DISM /Online /Cleanup-Image /RestoreHealth >> %TEMP%\cleaner.txt
sfc /scannow >> %TEMP%\cleaner.txt
echo.
echo Step 2: Cleaning Temporary Files...
copy %TEMP%\cleaner.txt %USERPROFILE%\cleaner.txt
del /F /Q "%TEMP%\*" >> %USERPROFILE%\cleaner.txt
move %USERPROFILE%\cleaner.txt %TEMP%\cleaner.txt
del /F /Q "C:\WIndows\Temp\*" >> %TEMP%\cleaner.txt
del /F /Q "C:\ProgramData\Microsoft\Windows\WER\Temp\*" >> %TEMP%\cleaner.txt
del /F /Q "C:\ProgramData\Package Cache\*" >> %TEMP%\cleaner.txt
echo.
echo Step 3: Cleaning Cache...
del /F /Q "C:\WIndows\prefetch\*" >> %TEMP%\cleaner.txt
del /F /Q "C:\ProgramData\Microsoft\Windows\Caches\*" >> %TEMP%\cleaner.txt
echo.
echo Step 4: Cleaning Component Store...
Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase >> %TEMP%\cleaner.txt
echo.
echo Step 5: Cleaning Windows Update...
rmdir /S /Q "C:\$Windows.~BT" >> %TEMP%\cleaner.txt
rmdir /S /Q "C:\$Windows.~WS" >> %TEMP%\cleaner.txt
del /F /Q "C:\Windows\SOftwareDistribution\*" >> %TEMP%\cleaner.txt
rmdir /S /Q "C:\Windows.old" >> %TEMP%\cleaner.txt
echo.
echo Step 6: Cleaning logs...
del /F /Q "C:\Windows\Panther\*" >> %TEMP%\cleaner.txt
del /F /Q "%SystemDrive%\Windows\Logs\CBS\*" >> %TEMP%\cleaner.txt
del /F /Q "%AppData%\Microsoft\Windows\Recent\*" >> %TEMP%\cleaner.txt
echo.
echo System Cleaned successfully! Check %TEMP%\cleaner.txt for details
pause
exit