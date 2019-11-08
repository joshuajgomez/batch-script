@echo off

set jarFilePath="C:\Users\1020593\batch-script\formatLog.jar"


@echo.
echo =============================
echo formatlog - LogFormatter tool
echo =============================
@echo.

:: Execute formatLog.jar
java -jar %jarFilePath% %1