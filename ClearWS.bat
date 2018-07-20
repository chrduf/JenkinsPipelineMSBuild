@echo off
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S bin') DO DEL /F /Q /S "%%G\*.*"
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S bin') DO RMDIR /S /Q "%%G"
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"

RMDIR /S /Q TestResults
RMDIR /S /Q Publish
RMDIR /S /Q NugetPackages
@echo off