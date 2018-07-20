
@echo off

set BuildStart=%DATE% at %TIME%
:: set variables
set vstudio=%vstudio%
:: We have to run a special Microsoft batch file to set environment for vcbuild
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsMSBuildCmd.bat"

msbuild JenkinsPipelineMSBuild.sln /m:2 /p:Configuration=debug /nologo /t:Clean,Build

