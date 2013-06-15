:: install.bat
::
:: Copies the files from the git repo into your local arma directory
:: 
:: 
:: Set your ArmA3 profile name below. The very first time you run this

SET LOCAL_ARMA_PROFILE=[KOS]Bewilderbeest
SET LOCAL_MISSION_NAME=KOS_Wasteland.Stratis
SET DESTINATION_DIR="%USERPROFILE%\Documents\Arma 3 Alpha - Other Profiles\%LOCAL_ARMA_PROFILE%\MPMissions\%LOCAL_MISSION_NAME%"

xcopy /s /y "%USERPROFILE%\Documents\GitHub\Wasteland" %DESTINATION_DIR%

:: Copy our globals to every directory which needs local access
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines.hpp" %DESTINATION_DIR%\client\
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines.hpp" %DESTINATION_DIR%\server\
copy "%USERPROFILE%\Documents\GitHub\Wasteland\defines.hpp" %DESTINATION_DIR%\server\functions\
