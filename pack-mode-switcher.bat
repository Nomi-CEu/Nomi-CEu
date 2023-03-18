@echo off

echo Nomifactory GTCEu Port / Pack mode switcher

setlocal
set normalCfgPath=%~dp0config-overrides\normal
set expertCfgPath=%~dp0config-overrides\expert
set targetPath=%~dp0config

echo Set pack mode
echo N: normal
echo E: expert (hard)
choice /c NE /m "selection"

if "%errorlevel%" == "1" goto copyNormal
if "%errorlevel%" == "2" goto copyExpert

:copyNormal
robocopy "%normalCfgPath%" "%targetPath%" *.* /e /nfl /ndl

rem If server.properties exists, update server config
IF EXIST server.properties (move "%targetPath%\server.properties" .\)
echo normal > .mode
goto end

:copyExpert
robocopy "%expertCfgPath%" "%targetPath%" *.* /e /nfl /ndl

rem If server.properties exists, update server config
IF EXIST server.properties (move "%targetPath%\server.properties" .\)
echo expert > .mode

:end
rem if server.properties is left over in the config path, remove it 
IF EXIST "%targetPath%/server.properties" DEL "%targetPath%\server.properties"
echo Switch completed
pause
exit
