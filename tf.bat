:: @file	tf.bat
:: @brief	Formats CamelCase texts to Caitalized text with underscores.
:: @req		textf-bin.jar
:: @author	Joshua Gomez

@echo off

:: Define constants
set jarFilePath="C:\Users\1020593\batch-script\textf-bin.jar"

:: Execute formatLog.jar
java -jar %jarFilePath% %*