:: Server Launch Script
::
:: Thrown together by Neeve in under five minutes, Public Domain
:: https://github.com/Neeve01
::
:: Added java version check by t0suj4, Public Domain
:: https://github.com/t0su4

:: DO NOT EDIT UNLESS YOU KNOW WHAT YOU'RE DOING
@ECHO OFF
SET FORGEJAR={{{forgeJar}}}
SET JAVA_PARAMETERS={{{jvmArgs}}}

:: these you can edit
SET MIN_RAM={{{minRAM}}}
SET MAX_RAM={{{maxRAM}}}

:: DO NOT EDIT ANYTHING PAST THIS LINE
SET LAUNCHPARAMS=-server -Xms%MIN_RAM% -Xmx%MAX_RAM% %JAVA_PARAMETERS% -Dlog4j.configurationFile=log4j2_112-116.xml -jar %FORGEJAR% nogui
echo Checking java version...
echo.
java -version
echo.
echo The expected java version is 1.8. Not higher, not lower.
echo.

echo Launching the server...
echo.
echo ^> java %LAUNCHPARAMS%
echo.
java %LAUNCHPARAMS%

echo.
echo ^> The server has stopped. If it's a crash, please read the output above.
echo.
pause
