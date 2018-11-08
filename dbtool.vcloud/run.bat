@REM ----------------------------------------------------------------------------
@REM RobotValidator Start Up Batch script
@REM ----------------------------------------------------------------------------
@echo off
set ERROR_CODE=0
title AIEngine Server

set APP_HOME=.
set JAVA_OPTS=-DAIEngineDT=1 -Xmn64M -Xms256M -Xmx256M -Xss256k -XX:SurvivorRatio=6 -XX:+DisableExplicitGC -XX:MaxPermSize=128M -XX:MaxDirectMemorySize=256M -Dsun.net.inetaddr.ttl=60 -DuseSafeMode=false

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome
echo.
echo ERROR: JAVA_HOME not found in your environment.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init
echo.
echo ERROR: JAVA_HOME is set to an invalid directory.
echo JAVA_HOME = %JAVA_HOME%
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation
echo.
goto error
@REM ==== END VALIDATION ====


:init
@REM Decide how to startup depending on the version of windows
set JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set CLASSPATH="%APP_HOME%\classes"
for %%i in ("%APP_HOME%"\dependency\*) do call :setclasspathfunc "%%i"
:endInit

echo %CLASSPATH%
@REM Start App
%JAVA_EXE% %JAVA_OPTS% -cp %CLASSPATH% com.er.dbtool.Entrance
@REM 1> stdout.log 2>&1

if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
exit /B %ERROR_CODE%

@REM Start Classpath Function
:setclasspathfunc
set CLASSPATH=%CLASSPATH%;%1
goto :EOF
