//	@file Version: 1.0
//	@file Name: mission_WepCache.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:

#include "sideMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_pos0","_pos1","_allMoneyUp","_pos2","_pos3","_vehicleClass","_cash0","_cash1","_cash2","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "Treasure_Marker";
_missionType = "Sunken Treasure";
_startTime = floor(time);

diag_log format["WASTELAND SERVER - Side Mission Started: %1",_missionType];

_rand = floor (random 9);
_posRand =	(getMarkerPos format ["treasure_%1", _rand]);

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1",_missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1",_missionType];

_ZCoor = -38.8307;
switch((_rand)) do
{
	case 0:
	{
		_ZCoor = -31;
	};
	case 1:
	{
		_ZCoor = -69;
	};
	case 2:
	{
		_ZCoor = -37;
	};
	case 3:
	{
		_ZCoor = -68;
	};
	case 4:
	{
		_ZCoor = -44;
	};
	case 5:
	{
		_ZCoor = -72;
	};
	case 6:
	{
		_ZCoor = -74;
	};
	case 7:
	{
		_ZCoor = -30;
	};
	case 8:
	{
		_ZCoor = -30;
	};
};

_fix = [_posRand select 0, _posRand select 1, _ZCoor];
_treas0 = createVehicle ["Land_Sack_F", _fix, [], 0, "CAN_COLLIDE"];
_treas0 setPos _fix;
_treas0 setVariable["money",10000,true];
_treas0 setVariable["owner","world",true];

["SunkenTreasure0",(position _treas0),_missionType] call createClientMarker;
_marker = createMarker ["SunkenTreasure0", position _treas0];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText _missionType;

_group = createGroup civilian;

_createVehicle = {
    private ["_type","_position","_moneyp","_direction","_group","_vehicle","_soldier"];
    
    _type = _this select 0;
    _position = _this select 1;
	_moneyp = _this select 2;
    _direction = _this select 3;
    _group = _this select 4;
    
    _vehicle = _type createVehicle _position;
	_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
    _vehicle setDir _direction;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    _group addVehicle _vehicle;
    
	_soldier1 = [_group, _moneyp] call createRandomAquaticSoldier; 
    _soldier2 = [_group, _position] call createRandomAquaticSoldier; 
    _soldier2 moveInDriver _vehicle;
    _soldier3 = [_group, _position] call createRandomAquaticSoldier; 
    _soldier3 moveInTurret [_vehicle, [0]];
    _soldier4 = [_group, _position] call createRandomAquaticSoldier; 
	_soldier4 moveInTurret [_vehicle, [1]];    
    _vehicle
};
_vehicles = [];
_vehicles set [0, ["O_Boat_Armed_01_hmg_F", [(_posRand select 0), (_posRand select 1), 0], _fix, 110, _group] call _createVehicle];

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>$10,000 in sunken treasure has been located. Go get it!</t>", _missionType,  sideMissionColor, subTextColor];
messageSystem = _hint;
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1",_missionType];
_startTime = floor(netTime);
waitUntil
{
    sleep 10; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
	//if(alive _cash0) then {_allMoneyUp = 0;}
	if(alive _treas0)then {_allMoneyUp = 0;}
	else {_allMoneyUp = 1;};
    (_result == 1) || (_allMoneyUp == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _treas0;
	{deleteVehicle _x;}forEach _vehicles;
	{deleteVehicle _x;}forEach units _group; 
	deleteGroup _group; 
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>Objective failed, better luck next time</t>", _missionType, failMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
		_unitsAlive = { alive _x } count units _group;
	if(_unitsAlive == 0) then
	{
		_ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
		clearMagazineCargoGlobal _ammobox;
		clearWeaponCargoGlobal _ammobox; 
		[_ammobox,"mission_USSpecial2"] call fn_refillbox;
		_ammobox2 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
		clearMagazineCargoGlobal _ammobox2;
		clearWeaponCargoGlobal _ammobox2; 
		[_ammobox2,"mission_USLaunchers2"] call fn_refillbox;
	};
	
	{if(!alive _x) then {deleteVehicle _x;};}forEach _vehicles;
	{deleteVehicle _x;}forEach units _group; 
	deleteGroup _group; 
    deleteVehicle _treas0;
	
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The money is yours! Help out your team!</t>", _missionType, successMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
["SunkenTreasure0"] call deleteClientMarker;