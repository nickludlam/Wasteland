//shipment of money starts at the docks and goes to General Store Docks
//create two hunters and two little birds and make them move to the general store on the east side

#include "defines.hpp"
#include "moneyMissionDefines.sqf"

private ["_missionMarkerName",
         "_missionType",
         "_picture",
         "_vehicle",
         "_vehicle2",
         "_vehicleName",
         "_laid1",
         "_laid2",
         "_laid3",
         "_laid4",
         "_laid5",
         "_laid6",
         "_cash1",
         "_cash2",
         "_cash3",
         "_cash4",
         "_cash5",
         "_cash6",
         "_hint",
         "_waypoint",
         "_waypoints",
         "_grouphsq",
         "_marker",
         "_failed",
         "_startTime",
         "_numWaypoints",
         "_leader",
         "_soldier1",
         "_soldier2",
         "_soldier3",
         "_soldier4",
         "_soldier5",
         "_soldier6",
         "_marker1",
         "_marker2",
         "_marker3",
         "_marker4",
         "_marker5",
         "_marker6"
         ];

_missionMarkerName = "Money_Shipment";
_missionType = "Money Shipment";

diag_log format["WASTELAND SERVER - Money Mission Started: %1", _missionType];

diag_log format["WASTELAND SERVER - Money Mission Waiting to run: %1", _missionType];
[moneyMissionDelayTime] call createWaitCondition;
diag_log format["WASTELAND SERVER - Money Mission Resumed: %1", _missionType];

_grouphsq = createGroup civilian;

_vehicle = "B_MRAP_01_gmg_F" createVehicle [2090.59,5823.05,5.41];
_vehicle addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
_vehicle setDir 91;
_vehicle setVariable ["newVehicle",1,true];

_vehicle2 = "B_MRAP_01_hmg_F" createVehicle [2057.48,5829.53,5.39773];
_vehicle2 addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
_vehicle2 setDir 91;
_vehicle2 setVariable ["newVehicle",1,true];

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle2;
clearWeaponCargoGlobal _vehicle2;
_grouphsq addVehicle _vehicle;
_grouphsq addVehicle _vehicle2;

_soldier1 = [_grouphsq, [2090.59,5823.05,5.41]] call createRandomSoldier; 
_soldier1 moveInDriver _vehicle;
_soldier2 = [_grouphsq, [2090.59,5823.05,5.41]] call createRandomSoldier; 
_soldier2 moveInCargo [_vehicle, 0];
_soldier3 = [_grouphsq, [2090.59,5823.05,5.41]] call createRandomSoldier;
_soldier3 moveInTurret [_vehicle, [0,0]];

_soldier4 = [_grouphsq, [2057.48,5829.53,5.39773]] call createRandomSoldier; 
_soldier4 moveInDriver _vehicle2;
_soldier5 = [_grouphsq, [2057.48,5829.53,5.39773]] call createRandomSoldier; 
_soldier5 moveInCargo [_vehicle2, 0];
_soldier6 = [_grouphsq, [2057.48,5829.53,5.39773]] call createRandomSoldier;
_soldier6 moveInTurret [_vehicle2, [0,0]];

_leader = driver (_vehicle);
_grouphsq selectLeader _leader;
_leader setRank "LIEUTENANT";

_grouphsq setCombatMode "GREEN";
_grouphsq setBehaviour "SAFE";
_grouphsq setFormation "STAG COLUMN";
_grouphsq setSpeedMode "LIMITED";

_waypoints = [
	[2471.57,5856.81,3.11851],
	[2752.89,5881.33,2.29961],
	[2865.82,6019.57,3.58147],
	[2895.27,6065.39,3.46353],
    [2948.59,6034.69,3.35],
    [3022.25,6030.58,3.35208],
    [2991.72,5836.46,6.61224],
    [3771.7,4784.15,194.209],
    [4454.26,4265.02,192.509],
    [5017.4,4524.54,178.042],
	[5361.36,3799.61,12.2615]
];

{
 _waypoint = _grouphsq addWaypoint [_x, 0];
 _waypoint setWaypointType "MOVE";
 _waypoint setWaypointCompletionRadius 20;
 _waypoint setWaypointCombatMode "GREEN"; // Defensiv behaviour
 _waypoint setWaypointBehaviour "SAFE"; // Force convoy to normaly drive on the street.
 _waypoint setWaypointFormation "STAG COLUMN";
 _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker1 = createMarker ["MoneyShipment1", position _soldier1];
_marker1 setMarkerType "mil_destroy";
_marker1 setMarkerSize [1.25, 1.25];
_marker1 setMarkerColor "ColorRed";
_marker1 setMarkerText "Money Shipment";

_marker2 = createMarker ["MoneyShipment2", position _soldier2];
_marker2 setMarkerType "mil_destroy";
_marker2 setMarkerSize [1.25, 1.25];
_marker2 setMarkerColor "ColorRed";
_marker2 setMarkerText "Money Shipment";

_marker3 = createMarker ["MoneyShipment3", position _soldier3];
_marker3 setMarkerType "mil_destroy";
_marker3 setMarkerSize [1.25, 1.25];
_marker3 setMarkerColor "ColorRed";
_marker3 setMarkerText "Money Shipment";

_marker4 = createMarker ["MoneyShipment4", position _soldier4];
_marker4 setMarkerType "mil_destroy";
_marker4 setMarkerSize [1.25, 1.25];
_marker4 setMarkerColor "ColorRed";
_marker4 setMarkerText "Money Shipment";

_marker5 = createMarker ["MoneyShipment5", position _soldier5];
_marker5 setMarkerType "mil_destroy";
_marker5 setMarkerSize [1.25, 1.25];
_marker5 setMarkerColor "ColorRed";
_marker5 setMarkerText "Money Shipment";

_marker6 = createMarker ["MoneyShipment6", position _soldier6];
_marker6 setMarkerType "mil_destroy";
_marker6 setMarkerSize [1.25, 1.25];
_marker6 setMarkerColor "ColorRed";
_marker6 setMarkerText "Money Shipment";

_picture = getText (configFile >> "CfgVehicles" >> "B_MRAP_01_gmg_F" >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> "B_MRAP_01_gmg_F" >> "displayName");
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Money Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> is carrying $10,000. Stop them and claim the money!</t>", _missionType, _picture, _vehicleName, moneyMissionColor, subTextColor];
messageSystem = _hint;
if (!isDedicated) then { call serverMessage };
publicVariable "messageSystem";

diag_log format["WASTELAND SERVER - Money Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _grouphsq;
_laid1 = 0;
_laid2 = 0;
_laid3 = 0;
_laid4 = 0;
_laid5 = 0;
_laid6 = 0;
_cash1 = nil;
_cash2 = nil;
_cash3 = nil;
_cash4 = nil;
_cash5 = nil;
_cash6 = nil;

waitUntil
{
    private ["_unitsAlive", "_moneyUp"];
    
    sleep 10; 
    
    _marker1 setMarkerPos (position  _soldier1);
	_marker2 setMarkerPos (position  _soldier2);
	_marker3 setMarkerPos (position  _soldier3);
	_marker4 setMarkerPos (position  _soldier4);
	_marker5 setMarkerPos (position  _soldier5);
	_marker6 setMarkerPos (position  _soldier6);
    
    if ((floor time) - _startTime >= moneyMissionTimeout) then { _failed = true };
    if (currentWaypoint _grouphsq >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    //_unitsAlive = { alive _x } count units _grouphsq;
	
	if((!alive _soldier1) AND (_laid1 == 0)) then
	{
	 _pos = (getMarkerPos _marker1);
	 _cash1 = "Land_Sack_F" createVehicle _pos; _cash1 setPos _pos;
     _cash1 setVariable[__MONEYBAG_VAR_NAME__,2000,true];
     _cash1 setVariable["owner","world",true];
	 _laid1 = 1;
	};
	
	if((!alive _soldier2) AND (_laid2 == 0))then
	{
	 _pos = (getMarkerPos _marker2);
	 _cash2 = "Land_Sack_F" createVehicle _pos; _cash2 setPos _pos;
     _cash2 setVariable[__MONEYBAG_VAR_NAME__,2000,true];
     _cash2 setVariable["owner","world",true];
	 _laid2 = 1;
	};
	
	if((!alive _soldier3) AND (_laid3 == 0))then
	{
	 _pos = (getMarkerPos _marker3);
	 _cash3 = "Land_Sack_F" createVehicle _pos; _cash3 setPos _pos;
     _cash3 setVariable[__MONEYBAG_VAR_NAME__,2000,true];
     _cash3 setVariable["owner","world",true];
	 _laid3 = 1;
	};
	
	if((!alive _soldier4) AND (_laid4 == 0)) then
	{
	 _pos = (getMarkerPos _marker4);
	 _cash4 = "Land_Sack_F" createVehicle _pos; _cash4 setPos _pos;
     _cash4 setVariable[__MONEYBAG_VAR_NAME__,2000,true];
     _cash4 setVariable["owner","world",true];
	 _laid4 = 1;
	};
	
	if((!alive _soldier5) AND (_laid5 == 0))then
	{
	 _pos = (getMarkerPos _marker5);
	 _cash5 = "Land_Sack_F" createVehicle _pos; _cash5 setPos _pos;
     _cash5 setVariable[__MONEYBAG_VAR_NAME__,1000,true];
     _cash5 setVariable["owner","world",true];
	 _laid5 = 1;
	};
	
	if((!alive _soldier6) AND (_laid6 == 0))then
	{
	 _pos = (getMarkerPos _marker6);
	 _cash6 = "Land_Sack_F" createVehicle _pos; _cash6 setPos _pos;
     _cash6 setVariable[__MONEYBAG_VAR_NAME__,1000,true];
     _cash6 setVariable["owner","world",true];
	 _laid6 = 1;
	};
	
	_moneyUp = false;
	if((_laid1 == 1)
		AND (_laid2 == 1)
		AND (_laid3 == 1)
		AND (_laid4 == 1)
		AND (_laid5 == 1)
		AND (_laid6 == 1)
		AND (!isNil "_cash1")
		AND (!isNil "_cash2")
		AND (!isNil "_cash3")
		AND (!isNil "_cash4")
		AND (!isNil "_cash5")
		AND (!isNil "_cash6")) then
	{
	 _moneyUp = true;
	}
	else {_moneyUp = false;};
	
    _failed || _moneyUp
};

if(_failed) then
{	
    // Mission failed
    deleteVehicle (_vehicle);
	deleteVehicle (_vehicle2);
	{deleteVehicle _x;}forEach units _grouphsq; 
	deleteGroup _grouphsq; 
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Money Mission Failed: %1",_missionType];
} else {
    // Mission complete
	if(!alive _vehicle) then {deleteVehicle (_vehicle)};
	if(!alive _vehicle2) then {deleteVehicle (_vehicle2)};
	{deleteVehicle _x;}forEach units _grouphsq; 
	deleteGroup _grouphsq; 
	
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The money shipment has been sucessfully stopped. Now all the money is yours!</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
    messageSystem = _hint;
    if (!isDedicated) then { call serverMessage };
    publicVariable "messageSystem";
    diag_log format["WASTELAND SERVER - Money Mission Success: %1",_missionType];
};

deleteMarker _marker1;
deleteMarker _marker2;
deleteMarker _marker3;
deleteMarker _marker4;
deleteMarker _marker5;
deleteMarker _marker6;

