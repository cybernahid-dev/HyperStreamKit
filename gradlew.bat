@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Find the location of the gradle wrapper jar.
set APP_JAR_DIR=%~dp0
if "%APP_JAR_DIR%"=="" set APP_JAR_DIR=.
set APP_JAR="%APP_JAR_DIR%gradle\wrapper\gradle-wrapper.jar"


@rem
@rem Do not edit below this line
@rem ##########################################################################

@rem Check for Cygwin
set CYGWIN=
if "%OS%"=="Windows_NT" if "%OSTYPE%"=="" if exist "%SystemRoot%\system32\cygwin1.dll" set CYGWIN=cygwin

@rem For Cygwin, switch paths to Windows format before running java
if not "%CYGWIN%" == "" (
  call :cygpath "%APP_HOME%" APP_HOME
  call :cygpath "%JAVA_HOME%" JAVA_HOME
  call :cygpath "%APP_JAR%" APP_JAR
  call :cygpath "%CLASSPATH%" CLASSPATH
)

@rem For Mingw, switch paths to Windows format before running java
if not "%MSYSTEM%" == "" (
  call :path -w "%APP_HOME%" APP_HOME
  call :path -w "%JAVA_HOME%" JAVA_HOME
  call :path -w "%APP_JAR%" APP_JAR
  call :path -w "%CLASSPATH%" CLASSPATH
)

@rem Add the jar to the classpath
set CLASSPATH=%APP_JAR%

@rem Execute Gradle
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% "-Dorg.gradle.appname=%APP_BASE_NAME%" -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %*

:fail
if "%OS%" == "Windows_NT" endlocal
exit /b 1

:cygpath
for /f "usebackq" %%a in (`cygpath -w "%~1"`) do set %2=%%a
goto :EOF

:path
for /f "usebackq" %%a in (`path "%~1"`) do set %2=%%a
goto :EOF