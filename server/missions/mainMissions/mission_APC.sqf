//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [KoS] Bewilderbeest
//	@file Created: 06/23/2013 13:32

#include "mainMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "APC_Marker";
_missionType = "Immobile APC";

diag_log format["WASTELAND SERVER - Main Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["Mission debug: createMissionLocation returned %1", _returnData];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

//diag_log format["Mission debug: createClientMarker returned '%1', '%2', '%3'", _missionMarkerName,_randomPos,_missionType];

_marker = createMarker [_missionMarkerName, _randomPos];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText _missionType;

_vehicleClass = ["B_APC_Wheeled_01_cannon_F", "O_APC_Wheeled_02_rcws_F"] call BIS_fnc_selectRandom;
//Vehicle Class, Posistion, Fuel, Ammo, Damage, State
_vehicle = [_vehicleClass,_randomPos,0.05,0.1,0.45,"NONE"] call createMissionVehicle;
_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];

// Add some enemies to make it interesting
CivGrpM = createGroup civilian;
[CivGrpM,_randomPos] spawn createMidGroup;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = _vehicleClass;
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A hostile squad's <t color='%4'>%3</t> has been immobilized. Seize it for your team!</t>", _missionType, _picture, _missionType, mainMissionColor, subTextColor];
messageSystem = _hint;
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1",_missionType];
_startTime = floor(time);

private ["_playerPresent"];
waitUntil
{
    sleep 10; 
	_playerPresent = false;
	 _currTime = floor(time);   
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
	_unitsAlive = ({alive _x} count units CivGrpM);
	_vehicleDamage = damage _vehicle;

	//diag_log format ["Mission debug: _playerPresent is %1", _playerPresent];
	//diag_log format ["Mission debug: _unitsAlive is %1", _unitsAlive];
	//diag_log format ["Mission debug: damage _vehicle is %1", _vehicleDamage];

    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1)) OR (_vehicleDamage == 1)
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

//diag_log format ["Mission debug: Mission has succeeded or failed"];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    {deleteVehicle _x;} forEach units CivGrpM;
    deleteGroup CivGrpM;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteGroup CivGrpM;
	if(!alive _vehicle) then {deleteVehicle _vehicle;};
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The APC has been captured</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	messageSystem = _hint;

    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";

    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;
