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
_missionMarkerName = "Mob_Marker";
_missionType = "Mob Money";
_startTime = floor(time);

diag_log format["WASTELAND SERVER - Side Mission Started: %1",_missionType];

_rand = floor (random 9);
_posRand =	(getMarkerPos format ["mobM_%1", _rand]);

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1",_missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1",_missionType];

_cash0 = createVehicle ["Land_Sack_F", _posRand, [], 0, "CAN_COLLIDE"]; 
_objects =  nearestObjects [_cash0, ["house"], 30];
_cash0 setPos _posRand;
_cash0 setPos ((_objects select 0) buildingPos 0);
_cash0 setVariable["money",3000,true];
_cash0 setVariable["owner","world",true];

_cash1 = createVehicle ["Land_Sack_F", _posRand, [], 0, "CAN_COLLIDE"]; 
_cash1 setPos _posRand;
_cash1 setPos ((_objects select 0) buildingPos 1);
_cash1 setVariable["money",3000,true];
_cash1 setVariable["owner","world",true];

_cash2 = createVehicle ["Land_Sack_F", _posRand, [], 0, "CAN_COLLIDE"]; 
_cash2 setPos _posRand;
_cash2 setPos ((_objects select 0) buildingPos 2);
_cash2 setVariable["money",4000,true];
_cash2 setVariable["owner","world",true];

["MoneyShipment0",(position _cash0),_missionType] call createClientMarker;
["MoneyShipment1",(position _cash1),_missionType] call createClientMarker;
["MoneyShipment2",(position _cash2),_missionType] call createClientMarker;
//_marker = createMarker ["MoneyShipment0", position _cash0];
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText _missionType;
//
//_marker = createMarker ["MoneyShipment1", position _cash1];
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText _missionType;
//
//_marker = createMarker ["MoneyShipment2", position _cash2];
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText _missionType;

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>$10,000 in mob money has been spotted. Go get it!</t>", _missionType,  sideMissionColor, subTextColor];
messageSystem = _hint;
publicVariable "messageSystem";

CivGrpS = createGroup civilian;
[CivGrpS,_posRand] spawn createLargeGroup;

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1",_missionType];
_startTime = floor(time);
waitUntil
{
    sleep 10; 
	_playerPresent = false;
	_currTime = floor(time);
	if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
	//if(alive _cash0) then {_allMoneyUp = 0;}
	if((alive _cash0) OR (alive _cash1) OR (alive _cash2)) then {_allMoneyUp = 0;}
	else {_allMoneyUp = 1;};
    (_result == 1) || (_allMoneyUp == 1)
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _cash0;
    deleteVehicle _cash1;
	deleteVehicle _cash2;
    {deleteVehicle _x;}forEach units CivGrps;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>Objective failed, better luck next time</t>", _missionType, failMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteVehicle _cash0;
    deleteVehicle _cash1;
	deleteVehicle _cash2;
	{deleteVehicle _x;}forEach units CivGrps;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The money is yours! Help out your team!</t>", _missionType, successMissionColor, subTextColor];
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
["MoneyShipment0"] call deleteClientMarker;
["MoneyShipment1"] call deleteClientMarker;
["MoneyShipment2"] call deleteClientMarker;