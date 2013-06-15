private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent"];

#include "sideMissionDefines.sqf";

//Mission Initialization.
_result = 0;
_missionMarkerName = "Truck_Marker";
_missionType = "Abandoned Truck";
diag_log format["WASTELAND SERVER - Side Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1",_missionType];
[sideMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1",_missionType];

//deploy
[_missionMarkerName,_randomPos,_missionType] call createClientMarker;
//_marker = createMarker [_missionMarkerName,_randomPos];
//_marker setMarkerType "mil_destroy";
//_marker setMarkerSize [1.25, 1.25];
//_marker setMarkerColor "ColorRed";
//_marker setMarkerText "Abandoned Truck";

//testing
//_marker = createMarkerLocal [_missionMarkerName, _randomPos];
//_marker setMarkerTypeLocal "mil_destroy";
//_marker setMarkerColorLocal "ColorRed";
//_marker setMarkerSizeLocal [1.25,1.25];
//_marker setMarkerTextLocal "Abandoned Truck";

//commented this out because it relies on vehicles not here. When more vehicles come out perhaps these will be included
//_vehicleClass = ["MtvrRefuel","MtvrReammo","MtvrRepair"] call BIS_fnc_selectRandom;
_vehicleClass = ["c_offroad","B_Hunter_F","O_Ifrit_F"] call BIS_fnc_selectRandom;

//Vehicle Class, Posistion, Fuel, Ammo, Damage
_vehicle = [_vehicleClass,_randomPos,1,1,0,"NONE"] call createMissionVehicle;

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Main Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t>, has been spotted. Go get it for your team.</t>", _missionType, _picture, _vehicleName, mainMissionColor, subTextColor];
if (!isDedicated) then { call serverMessage };
messageSystem = _hint;
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1",_missionType];
_startTime = floor(netTime);
waitUntil
{
	sleep 1; 
	_playerPresent = false;
    _currTime = floor(time);
    if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _vehicle <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    (_result == 1) OR (_playerPresent) OR ((damage _vehicle) == 1)
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
	if (!isDedicated) then { call serverMessage };
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
	if(!alive _vehicle) then {deleteVehicle _vehicle;};
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The truck has been captured!</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
	if (!isDedicated) then { call serverMessage };
	messageSystem = _hint;
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;