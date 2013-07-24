private ["_missionMarkerName","_missionType","_vehicleClass","_picture","_vehicleName","_hint","_waypoint","_waypoints","_groupsm","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader"];

#include "sideMissionDefines.sqf"

_missionMarkerName = "HostileHeli_Marker";
_missionType = "Hostile Helicopter";

diag_log format["WASTELAND SERVER - Side Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1", _missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1", _missionType];

_createVehicle = {
    private ["_type","_position","_direction","_groupsm","_vehicle","_soldier", "_soldier2", "_soldier3", "_soldier1"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _groupsm = _this select 3;
    
    _vehicle = _type createVehicle _position;
	_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
    _vehicle setDir _direction;
    _groupsm addVehicle _vehicle;
    
    _soldier = [_groupsm, _position] call createRandomPilot; 
    _soldier moveInDriver _vehicle;
	
	_soldier1 = nil;
	_soldier2 = nil;
	_soldier3 = nil;
	if(_type in ["O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"]) then { _soldier1 = [_groupsm, _position] call createRandomPilot; };
	if(_type == "B_Heli_Transport_01_F") then
	{
		_soldier2 = [_groupsm, _position] call createRandomPilot;
		_soldier3 = [_groupsm, _position] call createRandomPilot;
		_soldier3 assignAsGunner _vehicle;
	};
	if(_type == "B_Heli_Attack_01_F") then { _soldier3 = [_groupsm, _position] call createRandomPilot; };
	if (!isNil "_soldier1") then {_soldier1 moveInGunner _vehicle;};
	if (!isNil "_soldier2") then {_soldier2 moveInGunner _vehicle;};
	if (!isNil "_soldier3") then {_soldier3 moveInCargo _vehicle;};
    _vehicle
};

_vehicles = [];
_vehicleClass = ["B_Heli_Transport_01_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","B_Heli_Attack_01_F", "O_Heli_Attack_02_F", "O_Heli_Attack_02_black_F"] call BIS_fnc_selectRandom;
_groupsm = createGroup civilian;
_vehicles set [0, [_vehicleClass, [2436.24,847.9,0.00133419], 110, _groupsm] call _createVehicle];

_leader = driver (_vehicles select 0);
_groupsm selectLeader _leader;
_leader setRank "LIEUTENANT";

_groupsm setCombatMode "YELLOW";
_groupsm setBehaviour "DANGER";
_groupsm setFormation "STAG COLUMN";
_groupsm setSpeedMode "LIMITED";

_waypoints = [
	[2684.03,1023.94,0.0016098],
	[2832.09,2095.15,0.0016098],
	[1957.78,2472.15,18.9732],
	[2894.1,2203.47,82.2332],
	[3546.84,2043.99,30.1277],
	[3005.17,2661.56,158.849],
	[1986.16,2725.49,2.71976],
	[3033.41,2933.82,184.359],
	[4276.98,2678.09,2.54875],
	[5380.24,3778.89,4.272],
	[4309.09,4311.8,171.08],
	[3547.16,4899.02,198.805],
	[2025.93,5316.72,3.00144],
	[2113.17,5819.55,5.44485],
	[3066.7,6034.5,4.6925],
	[4611.05,5302.76,129.993],
	[5155.14,4971.72,215.788],
	[5522.43,4715.22,77.9704],
	[5522.43,4715.22,77.9704],
	[6396.9,5359.07,8.02473],
	[7081.3,5939.09,7.8737],
	[6054.19,5596.88,18.4],
	[5019.93,5912.98,208.608],
	[4503.45,6790.5,106.502],
	[3245.63,6826.87,4.09818],
	[3678.8,7600.36,50.6566],
	[3797.66,4300.41,128.483],
	[2618.91,550.284,51.626]
];
{
    _waypoint = _groupsm addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 55;
    _waypoint setWaypointCombatMode "WHITE"; // Defensiv behaviour
    _waypoint setWaypointBehaviour "AWARE"; // Force convoy to normaly drive on the street.
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker = createMarker [_missionMarkerName, position leader _groupsm];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Hostile Helicopter";

_picture = getText (configFile >> "CfgVehicles" >> _vehicleClass>> "picture");  
_vehicleName = getText (configFile >> "cfgVehicles" >> _vehicleClass >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>!! WARNING !!</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>An armed <t color='%4'>%3</t> is patrolling the island. Destroy it!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _groupsm;
waitUntil
{
    private ["_unitsAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position leader _groupsm);
    
    if ((floor time) - _startTime >= sideMissionTimeout) then { _failed = true };
    if (currentWaypoint _groupsm >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _groupsm;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    {deleteVehicle _x;}forEach _vehicles;
    {deleteVehicle _x;}forEach units _groupsm; 
	deleteGroup _groupsm; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>! NOTICE !</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The patrol ended, the enemy has survived and escaped</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
    // Mission complete	
	{
		_pos = getPosASL _x;
		_ammobox = "Box_IND_Wps_F" createVehicle [_pos select 0, _pos select 1, (_pos select 2) -10];
		[_ammobox,"mission_Mid_BAF"] call fn_refillbox;
		if(!alive _x) then {deleteVehicle _x;};
	}forEach _vehicles;
	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>PATROL IS DOWN</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The sky is clear agian, the enemy patrol was taken out!</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

deleteMarker _marker;
