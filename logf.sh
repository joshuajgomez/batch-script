#!/bin/sh
# author  : Joshua Gomez
# version : 1.0

jarFilePath="./logf-bin.jar"
inputFile="./input.txt"
textEditor="nano"

> $inputFile

$textEditor $inputFile

echo
echo ========================
echo logf - LogFormatter tool
echo ========================
echo

java -jar $jarFilePath $inputFile

rm $inputFile
