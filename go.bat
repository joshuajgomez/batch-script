@ECHO OFF

SET source=C:\Users\1020593\source\vendor\
SET script_dir=C:\Users\1020593\batch-script\

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
IF %option%==--help (
	:: Print help info
	GOTO HELP
) ELSE (
	:: Invalid arguments. Print help info
	ECHO go: Invalid argument: "%option%"
	GOTO HELP
)))))

:: Navigate to path
:DEFAULT
ECHO Going to %dest%
@ECHO:
CD %dest%
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
ECHO ^<empty^>     Same as 'dm'
@ECHO:
ECHO -------------------------------
ECHO go = Navigate to folders easily 
ECHO -------------------------------
@ECHO:

:: Exit program
:EXIT