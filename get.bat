@ECHO OFF

:: Define commands
SET cmds[0]="git status"
SET cmds[1]="git push origin HEAD:refs/for/o-r1l"
SET cmds[2]="git push origin HEAD:refs/for/o-r1l-quest-dev"
SET cmds[3]="git push origin HEAD:refs/for/o-r1l-gen2-quest-dev"

SET cmds[4]="git pull --rebase origin o-r1l"
SET cmds[5]="git pull --rebase origin o-r1l-quest-dev"
SET cmds[6]="git pull --rebase origin o-r1l-gen2-quest-dev"

:: Take arguments
SET option=%1

:: Check option and execute command
IF [%option%]==[0] (
	CALL :EXECUTE %cmds[0]%
) ELSE (
IF [%option%]==[1] (
	CALL :EXECUTE %cmds[1]%
) ELSE (
	IF [%option%]==[2] (
	CALL :EXECUTE %cmds[2]%
) ELSE (
	IF [%option%]==[3] (
	CALL :EXECUTE %cmds[3]%
) ELSE (
	IF [%option%]==[4] (
	CALL :EXECUTE %cmds[4]%
) ELSE (
	IF [%option%]==[5] (
	CALL :EXECUTE %cmds[5]%
) ELSE (
	IF [%option%]==[6] (
	CALL :EXECUTE %cmds[6]%
) ELSE (
	:: Invalid or no argument. Print help info
	GOTO HELP
)))))))
GOTO EXIT

:: Execute a command from a string
:EXECUTE
:: Remove " from string
SET command=%~1
SET command=%command:"=%
:: Print executing command
ECHO ^> %command%
@ECHO:
:: Execute command
%command%
GOTO EXIT

:: Display commands
:HELP
ECHO usage: get ^<option^>
@ECHO:
ECHO Available options are
@ECHO:
CALL :DISPLAY 0 %cmds[0]%
CALL :DISPLAY 1 %cmds[1]%
CALL :DISPLAY 2 %cmds[2]%
CALL :DISPLAY 3 %cmds[3]%
@ECHO:
CALL :DISPLAY 4 %cmds[4]%
CALL :DISPLAY 5 %cmds[5]%
CALL :DISPLAY 6 %cmds[6]%
GOTO EXIT

:: Function to display commands
:DISPLAY
ECHO %~1	%~2
GOTO EXIT

:: Exit program
:EXIT