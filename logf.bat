@echo off

:: Define constants
set jarFilePath="C:\Users\1020593\batch-script\logf-bin.jar"
set inputFile="input_logs.txt"
set textEditor="C:\Program Files\Notepad++\notepad++.exe"

:: Print info
@echo.
echo =============================
echo formatlog - LogFormatter tool
echo =============================
@echo.

:: Clear input file
break > %inputFile%

:: Open text editor for getting logs
%textEditor% %inputFile%

:: Wait for input 
set /p id=Paste log to editor and save it, press any key to continue...

@echo.
echo Formatted log:
@echo.

:: Execute formatLog.jar
java -jar %jarFilePath% %inputFile%

:: Delete input file
del %inputFile% /s /f /q >nul