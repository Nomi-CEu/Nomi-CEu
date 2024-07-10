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
echo normal > .mode
goto end

:copyExpert
robocopy "%expertCfgPath%" "%targetPath%" *.* /e /nfl /ndl
echo expert > .mode
goto end

:end
echo Switch completed
pause
exit
