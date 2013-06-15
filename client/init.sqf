//@file Version: 1.1
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [GoT] JoSchaap
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

#include "defines.hpp"

if(!X_Client) exitWith {};

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
currentMissionsMarkers = [];
currentRadarMarkers = [];
computedMoney = 0;

//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player};
waitUntil{time > 2};

//Call client compile list.
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if(!(playerSide in [west, east, resistance])) then {
	endMission "LOSER";
};

//Player setup
player call playerSetup;
player setVariable["positionLoaded", 0, true];

///////////////////////////////////////////////////////////////////////////
#ifdef __LOCAL_SERVER__
// We disable save & money functions when we're in local client/server mode
diag_log format ["Skipping client load/save/money functionality"];
#else
[] execVM "server\statSave\loadAccount.sqf";
[] execVM "server\statSave\saveToServer.sqf";
waitUntil {!isNil "fn_SaveToServer"};
[] execVM "server\statSave\loadStats.sqf";
waitUntil {!isNil "statFunctionsLoaded"};

//load in donation money
waitUntil {!isNil "moneyLoaded"};
computedMoney = player getVariable "computedMoney";
if(isNil 'computedMoney') then
{
	computedMoney = 0;
	player setVariable["computedMoney", 0, true];
};

if(player getVariable "cmoney" == 100) then 
{
	if(computedMoney > 0) then {player globalChat format["Thank you for your donation. You have spawned with $%1 extra cash.", computedMoney];};
	player setVariable["cmoney",100 + computedMoney,true];
};

waitUntil {!isNil "positionLoaded"};
#endif
///////////////////////////////////////////////////////////////////////////

_positionLoaded = player getVariable "positionLoaded";

//Setup player events.
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];
//player addMPEventHandler ["Killed", {[_this] call onMPKilled}];

//Setup player menu scroll action.
[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

"currentDate" addPublicVariableEventHandler {[] call timeSync};
"messageSystem" addPublicVariableEventHandler {[] call serverMessage};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

//client Executes
[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\createTownMarkers.sqf";
[] execVM "client\functions\createGunStoreMarkers.sqf";
//[] execVM "client\functions\createGeneralStoreMarkers.sqf";
//true[] execVM "client\functions\loadAtmosphere.sqf";
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;
if (isNil "FZF_IC_INIT") then   {
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};
if(_positionLoaded == 0)then{true spawn playerSpawn;};
[] spawn FZF_IC_INIT;
