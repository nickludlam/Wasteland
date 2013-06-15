//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:

if(!isServer) exitwith {};

#include "mainMissionDefines.sqf";
private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "APC_Marker";
_missionType = "Immobile APC";
_startTime = floor(time);

diag_log format["WASTELAND SERVER - Main Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1",_missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1",_missionType];

//[_missionMarkerName,_randomPos,_missionType] call createClientMarker;
//deploy
[_missionMarkerName,_randomPos,_missionType] call createClientMarker;
//[_missionMarkerName,_randomPos,_missionType] call createClientMarker;
//_marker = createMarker [_missionMarkerName,_randomPos];
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText "Immobile APC";

//testing
//_marker = createMarkerLocal [_missionMarkerName, _randomPos];
//_marker setMarkerTypeLocal "mil_destroy";
//_marker setMarkerColorLocal "ColorRed";
//_marker setMarkerSizeLocal [1.25,1.25];
//_marker setMarkerTextLocal "Immobile APC";

//_vehicleClass = ["BTR60_TK_EP1","M1126_ICV_MK19_EP1","BRDM2_TK_GUE_EP1","M113_UN_EP1","BTR90","LAV25","M6_EP1"] call BIS_fnc_selectRandom;
_vehicleClass = ["O_Ifrit_F","O_Ifrit_MG_F","O_Ifrit_GMG_F","B_Hunter_F","B_Hunter_HMG_F","B_Hunter_RCWS_F"] call BIS_fnc_selectRandom;

//Vehicle Class, Posistion, Fuel, Ammo, Damage, State
_vehicle = [_vehicleClass,_randomPos,0,1,0.75,"NONE"] call createMissionVehicle;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been immobilized! Go get it for your team!</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
if (!isDedicated) then { call serverMessage };
messageSystem = _hint;
publicVariable "messageSystem";

CivGrpM = createGroup civilian;
[CivGrpM,_randomPos] spawn createMidGroup;

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1",_missionType];
_startTime = floor(time);
waitUntil
{
    sleep 10; 
	_playerPresent = false;
	_currTime = floor(time);
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpM);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR ((damage _vehicle) == 1)
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	if (!isDedicated) then { call serverMessage };
	messageSystem = _hint;
	publicVariable "messageSystem";
	//Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteGroup CivGrpM;
	if(!alive _vehicle) then {deleteVehicle _vehicle;}j
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The APC has been captured, now go destroy the enemy!</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	if (!isDedicated) then { call serverMessage };
	messageSystem = _hint;
	publicVariable "messageSystem";
	//Reset the mission spawn bool
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;