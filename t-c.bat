:: @file	t-c.bat
:: @brief	Checks ticket list for duplicate entries
:: @req		ticket-compare-bin.jar
:: @author	Joshua Gomez

@echo off

:: Define constants
set jarFilePath="C:\Users\1020593\batch-script\ticket-compare-bin.jar"
set inputFile="%TEMP%\input_ticket_list.txt"
set textEditor="C:\Windows\system32\notepad.exe"

:: Print info
@echo.
echo ========================
echo t-c - Ticket duplicate checking tool
echo ========================
@echo.
echo Paste ticket list to file, then save and close...
@echo.

:: Clear input file
break > %inputFile%

:: Open text editor for getting logs
%textEditor% %inputFile%

:: Execute formatLog.jar
java -jar %jarFilePath% %inputFile%

:: Delete input file
del %inputFile% /s /f /q >nul