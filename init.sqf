//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.
//	@file Args:

//  	reset BIS_fnc_mp
"BIS_fnc_MP_packet" addPublicVariableEventHandler {};

#include "defines.hpp" // Global definitions file
#include "patch.sqf"
StartProgress = false;
enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
hitStateVar = false;
versionName = "2.3";
statsLoaded = 0;
doLoad = 1;
ssDebug = 1;

if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};

true spawn {
	if(!isDedicated) then {
		titleText ["Scripts and assets are loading please be patient", "BLACK", 0];
		waitUntil {player == player};
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

if(X_Server) then {
	diag_log format ["############################# %1 #############################", missionName];
	diag_log format["WASTELAND SERVER - Initializing Server"];
	
#ifdef __DISABLE_INIDB__
	diag_log "Skipping iniDB load";
#else
	call compile preProcessFile "\iniDB\init.sqf";
#endif

	[] execVM "server\init.sqf";	
};

if(X_Client) then {
	waitUntil {player == player};

	//Wipe Group.
	if(count units group player > 1) then
	{  
		diag_log "Player Group Wiped";
		[player] join grpNull;    
	};

	[] execVM "client\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf"; // Disabled until capture areas work properly

// This is global
clientRelayHandler = compile preprocessFileLineNumbers "client\functions\clientRelayHandler.sqf";
if (isNil "clientRelaySystem") then { clientRelaySystem = []; };
"clientRelaySystem" addPublicVariableEventHandler {[_this] call clientRelayHandler};

//Disable r3f on map/mission sided buildings (causes desync when moved)
//props to Tonic-_- at the BIS forums for this find! :)
if (isServer) then {
	waitUntil {!isNil {R3F_LOG_CFG_objets_deplacables}};
	{
    	if(!(_x in (allMissionObjects "Building"))) then
    	{
	        _x setVariable["R3F_LOG_disabled",true];
    	};
	} foreach (nearestObjects[[0,0], R3F_LOG_CFG_objets_deplacables, 20000]); 
};
if (!isDedicated) then {
	waitUntil {!isNil {R3F_LOG_CFG_objets_deplacables}};
	{
    	if(!(_x in (allMissionObjects "Building"))) then
    	{
	        _x setVariable["R3F_LOG_disabled",true];
    	};
	} foreach (nearestObjects[[0,0], R3F_LOG_CFG_objets_deplacables, 20000]); 
};

//if (isServer) then { execVM "antihack\setup.sqf" }
if(!isServer) then
{
	clientStarted = player;	
	publicVariableServer "clientStarted";
	execVM "client\functions\removeWatermark.sqf";
};
