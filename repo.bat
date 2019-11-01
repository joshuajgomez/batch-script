@ECHO off

SET source=C:\Users\1020593\source\vendor\

:: Set path to projects
SET dm=%source%quest\Phone\DeviceManagerService\
SET ph=%source%quest\Phone\PhoneHMI\
SET ps=%source%quest\Phone\PhoneService\

:: Invoke Sync function for each project
CALL :Sync %dm%
CALL :Sync %ph%
CALL :Sync %ps%
EXIT /B %ERRORLEVEL%


:: Define operations to be performed in project 
:Sync
@ECHO: 
ECHO Going to %~1
@ECHO: 
cd %~1

:: Git operations to be performed
git status
git fetch origin
EXIT /B 0