:: install.bat
::
:: This script has two functions
::
:: 'install.bat test'    - Copies the mission to your local MPMissions folder
:: 'install.bat package' - Compiles a PBO for testing with a standlone server

@ECHO OFF

:: Set your ArmA3 profile name etc below. The very first time you run this

IF "%username%" == "Nick Ludlam" (
	SET LOCAL_ARMA_PROFILE=[KoS]Bewilderbeest
	:: My local standalone server dir
	SET PBO_DESTINATION_DIR="C:\ArmaEditing\ArmA3\A3Master\MPMissions"
)

IF "%username%" == "Robert" (
	SET LOCAL_ARMA_PROFILE=[KoS]His_Shadow
	SET PBO_DESTINATION_DIR="G:\Games\a3master\MPMissions"
)

:: General definitions

SET SOURCE_DIR="%USERPROFILE%\Documents\GitHub\Wasteland"
SET PBO_TOOL="C:\Program Files (x86)\Bohemia Interactive\Tools\BinPBO Personal Edition\BinPBO.exe"

SET LOCAL_MISSION_NAME=KOS_Wasteland.Stratis
SET TEST_DESTINATION_DIR="%USERPROFILE%\Documents\Arma 3 - Other Profiles\%LOCAL_ARMA_PROFILE%\MPMissions\%LOCAL_MISSION_NAME%"

:: end config

IF %1.==. GOTO NOARG
IF "%1" == "test" GOTO TEST
IF "%1" == "package" GOTO PACKAGE
GOTO NOARG

:: Package mode - Creates a PBO file of the mission

:PACKAGE 

ECHO Packaging...

mkdir %TEMP%\%LOCAL_MISSION_NAME%
xcopy /q /s /y %SOURCE_DIR%\* %TEMP%\%LOCAL_MISSION_NAME%

:: Copy defines_servermode.hpp to the directories which use defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\client\defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\client\functions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\client\systems\adminPanel\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\client\systems\hud\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\server\defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\server\functions\defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\server\missions\sideMissions\defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_servermode.hpp" %TEMP%\%LOCAL_MISSION_NAME%\server\missions\mainMissions\defines.hpp

echo Copied to %TEMP%\%LOCAL_MISSION_NAME%

%PBO_TOOL% %TEMP%\%LOCAL_MISSION_NAME% %PBO_DESTINATION_DIR%\
rmdir %TEMP%\%LOCAL_MISSION_NAME% /s /q

GOTO END

:: Test mode - Install Wasteland to your MPMissions folder of your profile

:TEST

ECHO Building a test install...

IF exist %TEST_DESTINATION_DIR% ( echo Target dir exists ) ELSE ( mkdir %TEST_DESTINATION_DIR% )

xcopy /q /s /y %SOURCE_DIR% %TEST_DESTINATION_DIR%

:: Copy defines_localediting.hpp to the directories which use defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\functions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\adminPanel\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\hud\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\functions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\sideMissions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\mainMissions\defines.hpp > nul

echo Mission copied to %TEST_DESTINATION_DIR%

GOTO END

:NOARG

echo.
echo install.bat - Installs the ArmA mission for testing or packaging
echo.
echo Error: You must specify 'test' or 'package' as an argument
echo.

:END
