private ["_missionMarkerName","_missionType","_picture","_vehicleName","_hint","_randomPos","_waypoint","_waypoints","_groupsm","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader"];

#include "sideMissionDefines.sqf"

_missionMarkerName = "SerialKiller_Marker";
_missionType = "Serial Killer";

diag_log format["WASTELAND SERVER - Side Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1", _missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1", _missionType];

_groupsm = createGroup civilian;

_createVehicle = {
    private ["_type","_position","_direction","_groupsm","_vehicle","_soldier"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _groupsm = _this select 3;
    
    _vehicle = _type createVehicle _position;
	_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
    _vehicle setDir _direction;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    _groupsm addVehicle _vehicle;
    
    _soldier = [_groupsm, _position] call createRandomSoldier; 
    _soldier moveInDriver _vehicle; 
    _vehicle
};

_vehicle = ["C_Offroad_01_F",[4501.53,6778.33,108.319],195, _groupsm] call _createVehicle;
//_vehicles set [0, ["C_Offroad_01_F", [(_randomPos select 0) + 50, (_randomPos select 1) + 50,0], 110, _groupsm] call _createVehicle];
//_vehicles set [1, ["B_Quadbike_01_F", [2619.0709, 613.5274, 64.271773], 110, _groupsm] call _createVehicle];
//_vehicles set [2, ["O_Quadbike_01_F", [2607.2347, 627.8529, 63.935479], 110, _groupsm] call _createVehicle];

_leader = driver _vehicle;
_groupsm selectLeader _leader;
_leader setRank "LIEUTENANT";
removeUniform _leader;
removeVest _leader;
removeBackpack _leader;
removeHeadgear _leader;
removeGoggles _leader;
_leader addWeapon "arifle_MX_F";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addMagazine "30Rnd_65x39_case_mag";
_leader addMagazine "16Rnd_9x21_Mag";
_leader addMagazine "16Rnd_9x21_Mag";
_leader addMagazine "16Rnd_9x21_Mag";
_leader addWeapon "hgun_P07_F";
_leader selectWeapon "arifle_MX_F";

_groupsm setCombatMode "RED";
_groupsm setBehaviour "DANGER";
_groupsm setFormation "STAG COLUMN";
_groupsm setSpeedMode "FULL";

_waypoints = [
    [4393.8,6763.64,128.443],
    [4069.71,6333.69,122.667],
    [3613.92,6439.07,82.6659],
    [3353.73,6214.91,43.9128],
    [3006.38,6141.18,18.0004],
    [2928.62,6106.61,7.76618],
    [2872.17,6034.61,1.63306],
    [2835.3,5929.2,2.31124],
    [2410.77,5843.94,3.79691],
    [2054.78,5828.91,5.4098]//,
    //[5179.1089,5317.814,190.49104],
    //[5355.2534,5447.2158,172.12018],
    //[5209.6572,5804.0298,159.34062],
    //[4650.4116,5920.8677,140.14188],
    //[4989.0015,6177.1587,157.54677],
    //[4795.2671,6547.9424,122.12956],
    //[4093.5972,6355.2212,124.87359],
    //[4376.2495,6777.9741,129.06226]
];
{
    _waypoint = _groupsm addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "RED"; 
    _waypoint setWaypointBehaviour "DANGER"; 
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "FULL";
} forEach _waypoints;

//deploy
_marker = createMarker [_missionMarkerName, position _leader];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Serial Killer";

//testing
//_marker = createMarkerLocal [_missionMarkerName, position _leader];
//_marker setMarkerTypeLocal "mil_destroy";
//_marker setMarkerColorLocal "ColorRed";
//_marker setMarkerSizeLocal [1.25,1.25];
//_marker setMarkerTextLocal "Serial Killer";


_picture = getText (configFile >> "CfgVehicles" >> "C_Offroad_01_F" >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> "C_Offroad_01_F" >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A serial killer is driving an <t color='%4'>%3</t>. Stop him!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
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
    //if (currentWaypoint _groupsm >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _groupsm;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units _groupsm; 
	deleteGroup _groupsm; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed! He lives to kill another day.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
    // Mission complete
	if(!alive _vehicle) then {deleteVehicle _vehicle;};
    _ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox;
    clearWeaponCargoGlobal _ammobox; 
    [_ammobox,"mission_Side_USSpecial"] call fn_refillbox;
    _ammobox2 = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
    clearMagazineCargoGlobal _ammobox2;
    clearWeaponCargoGlobal _ammobox2; 
    [_ammobox2,"mission_USLaunchers2"] call fn_refillbox;
	{deleteVehicle _x;}forEach units _groupsm; 
	deleteGroup _groupsm; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The serial killer has been sucessfully stopped. His weapons and truck are yours.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

deleteMarker _marker;
