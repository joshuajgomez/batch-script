@ECHO OFF

SET source=D:\source\vendor\
SET script_dir=C:\Users\1020593\batch-script\
SET java_projects=C:\Users\1020593\eclipse-workspace\
SET chatdaemon=C:\Users\1020593\josh-projects\android-projects\chatdaemon\
SET r1l=D:\r1l_data\
SET r1l_log=D:\r1l_data\log\gen2\

:: Set path to projects
SET dm=%source%quest\Phone\DeviceManagerService\
SET ph=%source%quest\Phone\PhoneHMI\
SET ps=%source%quest\Phone\PhoneService\

:: Take arguments
SET option=%1

:: Set default destination path
SET dest=%dm%

:: If no arguments, proceed with default option
IF [%option%]==[] GOTO DEFAULT
	 
IF %option%==dm (
	:: Goto DeviceManagerService
	SET dest=%dm%
) ELSE (
IF %option%==ph (
	:: Goto PhoneHMI
	SET dest=%ph%
) ELSE (
IF %option%==ps (
	:: Goto PhoneService
	SET dest=%ps%
) ELSE (
IF %option%==dev (
	:: Goto Scripts directory
	SET dest=%script_dir%
) ELSE (
IF %option%==~ (
	:: Goto home
	SET dest=C:\Users\1020593\
) ELSE (
IF %option%==--help (
	:: Print help info
	GOTO HELP
) ELSE (
IF %option%==jdev (
	:: Goto java projects dir
	SET dest=%java_projects%
) ELSE (
::::::::::::::::::::::: Copy this block to create new option - START - Ensure to add a ')' at that end of the 'IF ELSE' block
IF %option%==r (
	:: Goto r1l data folder
	SET dest=%r1l%
) ELSE (
::::::::::::::::::::::: Copy this block to create new option - END - Ensure to add a ')' at that end of the 'IF ELSE' block
IF %option%==c (
	:: Goto android project: chatdaemon
	SET dest=%chatdaemon%
) ELSE (
IF %option%==rl (
	:: Goto r1l log data folder
	SET dest=%r1l_log%
) ELSE (
	:: Invalid arguments. Print help info
	ECHO go: Invalid argument: "%option%"
	GOTO HELP
))))))))))

:: Navigate to path
:DEFAULT
ECHO Going to %dest%
@ECHO:
CD /D %dest%
GOTO EXIT

:: Print help message
:HELP
@ECHO:
ECHO usage: go ^<option^>
@ECHO:
ECHO Available options are:
@ECHO:
ECHO dm 	    %dm%
ECHO ph 	    %ph%
ECHO ps 	    %ps%
ECHO dev 	    %script_dir%
ECHO r 	    %r1l%
ECHO rl	    %r1l_log%
ECHO ~ 	    Go home
ECHO ^<empty^>     Same as 'dm'
@ECHO:
ECHO -------------------------------
ECHO go = Navigate to folders easily 
ECHO -------------------------------
@ECHO:

:: Exit program
:EXIT