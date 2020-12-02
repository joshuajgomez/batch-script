:: @file	tc.bat
:: @brief	Find tickets from input text and removes duplicate entries
:: @req		tf-bin.jar
:: @author	Joshua Gomez

@echo off

:: Define constants
set jarFilePath="C:\Users\1020593\batch-script\tf-bin.jar"
set inputFile="%TEMP%\input_ticket_list.txt"
set textEditor="C:\Windows\system32\notepad.exe"

:: Print info
@echo.
echo ========================
echo tc - Ticket listing tool
echo ========================
@echo.
echo Paste text containing tickets to file, then save and close...
@echo.

:: Clear input file
break > %inputFile%

:: Open text editor for input
%textEditor% %inputFile%

:: Execute tc-bin.jar
java -jar %jarFilePath% %inputFile% %1

:: Delete input file
del %inputFile% /s /f /q >nul