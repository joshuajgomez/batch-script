:: @file	t-c.bat
:: @brief	Find tickets from input text and removes duplicate entries
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
echo t-c - Ticket listing tool
echo ========================
@echo.
echo Paste text containing tickets to file, then save and close...
@echo.

:: Clear input file
break > %inputFile%

:: Open text editor for input
%textEditor% %inputFile%

:: Execute ticket-compare-bin.jar
java -jar %jarFilePath% %inputFile%

:: Delete input file
del %inputFile% /s /f /q >nul