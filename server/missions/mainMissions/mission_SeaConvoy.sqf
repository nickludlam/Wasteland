private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_waypoint","_waypoints","_group","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader","_starts0","_starts1",
"_rand","_cash0","_ammobox2"];

#include "defines.hpp"
#include "mainMissionDefines.sqf"

_missionMarkerName = "SeaPatrol_Marker";
_missionType = "Sea Patrol";

diag_log format["WASTELAND SERVER - Main Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1", _missionType];
[mainMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Main Mission Resumed: %1", _missionType];

_group = createGroup civilian;

_createVehicle = {
    private ["_type","_position","_direction","_group","_vehicle","_soldier", "_soldier1", "_soldier2", "_soldier3", "_soldier4"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _group = _this select 3;
    
    _vehicle = _type createVehicle _position;
	_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
	_vehicle setVariable["newVehicle",1,true];
	
    _vehicle setDir _direction;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    _group addVehicle _vehicle;
    
    _soldier1 = [_group, _position] call createRandomAquaticSoldier; 
    _soldier1 moveInDriver _vehicle;
    _soldier2 = [_group, _position] call createRandomAquaticSoldier; 
    _soldier2 moveInCargo [_vehicle, 0];
    _soldier3 = [_group, _position] call createRandomAquaticSoldier; 
    _soldier3 moveInTurret [_vehicle, [0]];
    _soldier4 = [_group, _position] call createRandomAquaticSoldier; 
	_soldier4 moveInTurret [_vehicle, [1]];
    
    _vehicle
};

//three possible starts for both ships
_starts0 = [];
_starts0 set [0, [1908.98,5246.9,-1.67363]];
_starts0 set [1, [3163.68,913.556,-1.74751]];
_starts0 set [2, [1204.81,4879.68,-1.70755]];

_starts1 = [];
_starts1 set [0, [1926.28,5248.97,-1.66718]];
_starts1 set [1, [3130.95,919.673,-1.71368]];
_starts1 set [2, [1248.54,4883.98,-1.72229]];


//select a random start point
_rand = floor (random 3);

_vehicles = [];
_vehicles set [0, ["O_Boat_Armed_01_hmg_F", (_starts0 select _rand), 110, _group] call _createVehicle];
_vehicles set [1, ["B_Boat_Armed_01_minigun_F", (_starts1 select _rand), 110, _group] call _createVehicle];

_leader = driver (_vehicles select 0);
_group selectLeader _leader;
_leader setRank "LIEUTENANT";

_group setCombatMode "YELLOW";
_group setBehaviour "SAFE";
_group setFormation "STAG COLUMN";
_group setSpeedMode "LIMITED";

_waypoints = [];
switch((_rand)) do
{
	case 0:
	{
		_waypoints = [[1972.17,4978.87,-1.69494],
						[1919.46,4666.21,-1.75965],
						[1966.25,4502.84,-1.64588],
						[1830.92,4343.79,-1.67514],
						[1854.49,4215.72,-1.60113],
						[1915.08,4141.14,-1.67884],
						[1865.29,4065.4,-1.6403],
						[1794.03,3988.73,-1.62585],
						[1772.26,3921.12,-1.68482],
						[1743.99,3764.44,-1.62518],
						[1741.31,3667.12,-1.67635],
						[1772.39,3557.99,-1.61686],
						[1839.37,3509.08,-1.6352],
						[1792.45,3452.73,-1.59912],
						[1764.92,3340.86,-1.58034],
						[1817.31,3253.99,-1.61834],
						[1736.59,2986.73,-1.59754],
						[1807.98,2601.8,-1.62613],
						[1863,2221.37,-1.6197],
						[1917.23,1822.89,-1.5691],
						[2094.36,1835.3,-1.67887],
						[2045.98,1692.42,-1.61244],
						[2058.2,1508.98,-1.66819],
						[2099.94,1289.02,-1.67626],
						[2241.54,1145.77,-1.57656],
						[2349.03,1125.77,-1.60384],
						[2244.34,1078.86,-1.66708],
						[2251.87,907.156,-1.683]];
    };
	case 1:
	{
		_waypoints = 	[[2961.68,647.368,-1.6772],
						[3120.35,1054.63,-1.6779],
						[3340.82,1347.26,-1.55354],
						[3494.5,1640.2,-1.54358],
						[3787.26,1999.18,-1.49845],
						[4019.83,2241.83,-1.55649],
						[4197.81,2493.34,-1.57475],
						[4247.64,2604.08,-1.62745],
						[4433.29,2498.11,-1.59435],
						[4641.97,2546.31,-1.63953],
						[4772.36,2723.02,-1.70083],
						[4833.33,2653.57,-1.64042],
						[4990.59,2861.71,-1.54711],
						[5226.45,3169.46,-1.54271],
						[5348.39,3474.46,-1.58383],
						[5430.06,3561.3,-1.55569],
						[5405.84,3714.92,-1.55327],
						[5490.05,3706.65,-1.70629],
						[5524.1,3799.05,-1.55434],
						[5623.35,3804.12,-1.5532],
						[5695.62,3841.7,-1.5552],
						[5966.8,3920.06,-1.5529],
						[6244.98,4142.92,-1.54688],
						[6153.11,4346.92,-1.55694],
						[6464.11,4520.62,-1.61701],
						[6623.03,4779.12,-1.54327],
						[6544.96,4879.35,-1.57196],
						[6642.25,4859.35,-1.52645],
						[6692.32,4964.32,-1.53789],
						[6763.23,4909.66,-1.51044],
						[6842.6,4993.77,-1.54845],
						[6762.86,5123.47,-1.64231],
						[6929.57,5210.04,-1.58305],
						[6884.65,5421.51,-1.60634],
						[6653.08,5500.74,-1.535],
						[6545.35,5451.65,-1.7872],
						[6480.08,5536.56,-1.63281],
						[6403.43,5609.4,-1.70226],
						[6281.83,5696.04,-1.59383],
						[5981.55,5974.75,-1.53903]];
    };
	case 2:
	{
		_waypoints = [[1387.92,5205.74,-1.60102],
						[1496.18,5520.75,-1.62475],
						[1580.08,5836.39,-1.56966],
						[1709.97,6239.37,-1.62549],
						[1852.4,6409.87,-1.55638],
						[2068.87,6167.14,-1.6147],
						[2115.88,6049.44,-1.53367],
						[2250.96,6034.56,-1.59215],
						[2311.91,6020.79,-1.60329],
						[2309.38,5945.51,-1.59723],
						[2175.02,5898.35,-1.54968],
						[2213.51,5860.23,-1.58848],
						[2325.64,5880.21,-1.58662],
						[2476.01,5917.25,-1.59016],
						[2591.88,5901.6,-1.53506],
						[2664.12,5879.87,-1.57786],
						[2724.72,5957.67,-1.60429],
						[2767.91,5956.56,-1.60244],
						[2798.05,6055.92,-1.44477],
						[2764.2,6065.69,-1.59318],
						[2732.63,6041,-1.59129],
						[2713.15,6025.58,-1.60076],
						[2669.19,6056.17,-1.55019],
						[2724.32,6129.63,-1.54114],
						[2900.43,6325.19,-1.55399],
						[3018.15,6537.39,-1.59574],
						[3006.99,6854.69,-1.55006],
						[3150.43,6904.43,-1.60889],
						[3094.02,7099.6,-1.55037]];
    };
};	
	
{
    _waypoint = _group addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "YELLOW"; // Defensiv behaviour
    _waypoint setWaypointBehaviour "SAFE"; // Force convoy to normaly drive on the street.
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker = createMarker [_missionMarkerName, position leader _group];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Sea Convoy";

_picture = getText (configFile >> "CfgVehicles" >> "O_Boat_Armed_01_hmg_F" >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> "O_Boat_Armed_01_hmg_F" >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> is convoyed with another %3. Stop them!</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _group;
waitUntil
{
    private ["_unitsAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position leader _group);
   
    if ((floor time) - _startTime >= mainMissionTimeout) then { _failed = true };
    if (currentWaypoint _group >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _group;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    {deleteVehicle _x;}forEach _vehicles;
	{deleteVehicle _x;}forEach units _group; 
	deleteGroup _group; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {

	{if(!alive _x) then {deleteVehicle _x;};}forEach _vehicles;
	{deleteVehicle _x;}forEach units _group; 
	deleteGroup _group; 
	
    // Mission complete
	_cash0 = createVehicle ["Land_Sack_F", (getMarkerPos _marker), [], 0, "CAN_COLLIDE"]; 
	_cash0 setVariable[__MONEYBAG_VAR_NAME__,5000,true];
	_cash0 setVariable["owner","world",true];
	
    _ammobox = "Box_NATO_WpsSpecial_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox;
    clearWeaponCargoGlobal _ammobox; 
    [_ammobox,"mission_USSpecial2"] call fn_refillbox;
	
    _ammobox2 = "Box_EAST_WpsSpecial_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox2;
    clearWeaponCargoGlobal _ammobox2; 
    [_ammobox2,"mission_USLaunchers2"] call fn_refillbox;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The convoy has been sucessfully stopped. Now the weapons and cars are yours.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
};

deleteMarker _marker;
