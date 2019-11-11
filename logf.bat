@echo off

:: Define constants
set jarFilePath="C:\Users\1020593\batch-script\logf-bin.jar"
set inputFile="C:\Users\1020593\batch-script\input_logs.txt"
set textEditor="C:\Windows\system32\notepad.exe"

:: Print info
@echo.
echo ========================
echo logf - LogFormatter tool
echo ========================
@echo.

echo Paste logs to file, then save and close...

:: Clear input file
break > %inputFile%

:: Open text editor for getting logs
%textEditor% %inputFile%

@echo.
echo Formatted log:
@echo.

:: Execute formatLog.jar
java -jar %jarFilePath% %inputFile%

:: Delete input file
del %inputFile% /s /f /q >nul