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
del "%targetPath%\globalgamerules.cfg"
if exist server.properties.normal (
    move server.properties server.properties.expert
    move server.properties.normal server.properties
) else (
    echo Server.properties file not moved
)
goto end
:copyExpert
robocopy "%expertCfgPath%" "%targetPath%" *.* /e /nfl /ndl
if exist server.properties.expert (
    move server.properties server.properties.normal
    move server.properties.expert server.properties
) else (
    echo Server.properties file not moved
)
goto end

:end
echo Switch completed
pause
exit
