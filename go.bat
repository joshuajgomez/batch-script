@ECHO OFF

REM Creating a Newline variable (the two blank lines are required!)

SET source=C:\Users\1020593\source\vendor\

SET dm=quest\Phone\DeviceManagerService\
SET ph=quest\Phone\PhoneHMI\
SET ps=quest\Phone\PhoneService\

SET option=%1

SET dest=%source%%dm%

:: If no arguments, proceed with default option
IF [%option%]==[] GOTO DEFAULT
	 
IF %option%==dm (
	:: Goto DeviceManagerService
	SET dest=%source%%dm%
) ELSE (
	IF %option%==ph (
		:: Goto PhoneHMI
		SET dest=%source%%ph%
	) ELSE (
		IF %option%==ps (
			:: Goto PhoneService
			SET dest=%source%%ps%
		) ELSE (
			:: Invalid arguments
			ECHO Invalid argument: %option%
			@ECHO:
			ECHO To navigate to project folders, use: go ^<option^>
			@ECHO:
			ECHO Available destinations are:
			@ECHO:
			ECHO dm 	 %dm%
			ECHO ph 	 %ph%
			ECHO ps 	 %ps%
			@ECHO:
			GOTO EXIT
		)
	)
)


:DEFAULT
ECHO Going to %dest%
@ECHO:
CD %dest%


:EXIT














