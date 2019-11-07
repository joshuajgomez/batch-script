@echo off

:: Set variables
set meld="C:\Program Files (x86)\Meld\Meld.exe"
set source_project=C:\Users\1020593\source\vendor\quest\Phone\
set dest_project=C:\cygwin64\home\1020593\source\
set dm=DeviceManagerService\
set ph=PhoneHMI\
set ps=PhoneService\
set rev=-r

:: Set source and destination for meld
set source=%source_project%%dm% 
set dest=%dest_project%%dm% 

:: Take options
set option=%1
set direction=%2

:: If no arguments, proceed with default option
IF [%option%]==[] (
	call :compare %source% %dest%
	goto exit
)


if [%option%]==[dm] (
	set source=%source_project%%dm% 
	set dest=%dest_project%%dm% 
) else (
if [%option%]==[ph] (
	set source=%source_project%%ph% 
	set dest=%dest_project%%ph% 
) else (
if [%option%]==[ps] (
	set source=%source_project%%ps% 
	set dest=%dest_project%%ps% 
) else (
	:: Invalid argument. Print help
	goto help
)))

if [%direction%]==[%rev%] (
	call :compare %dest% %source%
) else (
	call :compare %source% %dest%
)
goto exit

:: Print info & execute
:compare
echo meld: Comparing
@echo:
echo source: %~1
echo dest: %~2
:: Execute command
%meld% %~1 %~2
goto exit

:: Print Help
:help
echo usage: meld [^<option^>] [%rev%]
@echo:
echo Available options are:
echo     ^<empty^>	compare %dm%
echo     dm		compare %dm%
echo     ph		compare %ph%
echo     ps		compare %ps%
@echo:
echo Available directions:
echo     ^<empty^>	Working directory to Buffer directory 
echo     %rev%		Buffer directory to Working directory
goto exit

:: Exit program
:exit