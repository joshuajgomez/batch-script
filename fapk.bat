:: @brief	fetch tool to extract and fetch the APK files from custom artifact list builds
:: @req		fapk_script.py
:: @author	Joshua Gomez

@echo off

:: Define constants
set scriptPath="C:\Users\1020593\batch-script\fapk_script.py"

:: Execute tc-bin.jar
python %scriptPath% %1