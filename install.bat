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

SET LOCAL_MISSION_TEST=KOS_Wasteland.Stratis
SET LOCAL_MISSION_NAME=KOS_Wasteland_INDEX.Stratis
SET SERVER_DEFINES_NAME=defines_server_INDEX.hpp

SET TEST_DESTINATION_DIR="%USERPROFILE%\Documents\Arma 3 - Other Profiles\%LOCAL_ARMA_PROFILE%\MPMissions\%LOCAL_MISSION_TEST%"

:: end config

IF %1.==. GOTO NOARG
IF "%1" == "test" GOTO TEST
IF "%1" == "package" GOTO PACKAGE
GOTO NOARG

:: Package mode - Creates a PBO file of the mission

:PACKAGE 

ECHO Packaging...

:: Create 3 different .pbo's in order to enable separate save entries for the three servers
SETLOCAL ENABLEDELAYEDEXPANSION
SET LOCAL_MISSION_NAME_MODIFIED=
SET SERVER_DEFINES_NAME_MODIFIED=
FOR %%A IN (1 2 3) DO (

:: Replace INDEX in the name of the mission file with the server number 
SET LOCAL_MISSION_NAME_MODIFIED=!LOCAL_MISSION_NAME:INDEX=%%A!
SET SERVER_DEFINES_NAME_MODIFIED=!SERVER_DEFINES_NAME:_INDEX=%%A!

mkdir !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!
xcopy /q /s /y !SOURCE_DIR!\* !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!

:: Copy server specific .hpp to the directories which use the server specific .hpp
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\!SERVER_DEFINES_NAME_MODIFIED!" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\itemSave\serverDefines.hpp > nul

:: Copy defines_servermode.hpp to the directories which use defines.hpp
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\actions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\clientEvents\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\functions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\adminPanel\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\vehStore\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\gunStore\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\generalStore\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\playerMenu\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\hud\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\client\systems\groups\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\functions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\missions\sideMissions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\missions\mainMissions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\missions\bountyMissions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\missions\moneyMissions\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\statSave\defines.hpp > nul
copy "!USERPROFILE!\Documents\GitHub\Wasteland\defines\defines_servermode.hpp" !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!\server\itemSave\defines.hpp > nul

echo Copied to !TEMP!\!LOCAL_MISSION_NAME_MODIFIED!

!PBO_TOOL! !TEMP!\!LOCAL_MISSION_NAME_MODIFIED! !PBO_DESTINATION_DIR!\
rmdir !TEMP!\!LOCAL_MISSION_NAME_MODIFIED! /s /q
)

GOTO END

:: Test mode - Install Wasteland to your MPMissions folder of your profile

:TEST

ECHO Building a test install...

IF exist %TEST_DESTINATION_DIR% ( echo Target dir exists ) ELSE ( mkdir %TEST_DESTINATION_DIR% )

xcopy /q /s /y %SOURCE_DIR% %TEST_DESTINATION_DIR%

:: Copy defines_localediting.hpp to the directories which use defines.hpp
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\actions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\clientEvents\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\functions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\adminPanel\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\vehStore\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\gunStore\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\generalStore\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\playerMenu\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\groups\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\client\systems\hud\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\functions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\sideMissions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\mainMissions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\bountyMissions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\missions\moneyMissions\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\statSave\defines.hpp > nul
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines\defines_localediting.hpp" %TEST_DESTINATION_DIR%\server\itemSave\defines.hpp > nul

echo Mission copied to %TEST_DESTINATION_DIR%

GOTO END

:NOARG

echo.
echo install.bat - Installs the ArmA mission for testing or packaging
echo.
echo Error: You must specify 'test' or 'package' as an argument
echo.

:END
