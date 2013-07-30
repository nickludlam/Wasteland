//	@file Version: 1.0
//	@file Name: airdrop.sqf
//	@file Author: Bewilderbeest
//	@file Created: 07/28/2013 14:32
//	@file Desc: Delivers a vehicle by airdrop

// First arg is the vehicle object
// Second arg is destination position

#include "defines.hpp"

if(!isServer) exitWith {};

private ["_deliveryPos", "_vehType", "_colorText", "_veh", "_heli", "_spawnPosHeli", "_spawnPosVehicle", "_group", "_pilot", "_done", "_wp"];

if (count _this == 0) exitWith { diag_log "Dummy call"; };

_veh = _this select 0;
_deliveryPos = _this select 1;

if (isNil "_veh" or isNil "_deliveryPos") exitWith { diag_log format["ERROR: _veh was %1 and _deliveryPos was %2", _veh, _deliveryPos]; }; 

diag_log format ["_veh is %1, _deliveryPos is %2", _veh, _deliveryPos];

if (alive _veh) then {
	diag_log "Vehicle alive at start";
};


_hoverPos = _deliveryPos;
_hoverPos set [2, (_hoverPos select 2) + 50]; // Higher

_spawnPosHeli1 = [5291.24,7906.9,220.0];
_spawnPosHeli2 = [162.539,639.737,220.0];
_spawnPosHeli3 = [206.119,7109.83,220.0];

_spawnPosPilot = [3786.45,7912.79,17.5];

_spawnPosHelis = [_spawnPosHeli1, _spawnPosHeli2, _spawnPosHeli3];

// Find the closest spawn point
_chosenSpawnPos = _spawnPosHeli1;

if (_deliveryPos distance _spawnPosHeli2 < _deliveryPos distance _chosenSpawnPos) then {
	_chosenSpawnPos = _spawnPosHeli2;
	diag_log "Chose _spawnPosHeli2";
};
if (_deliveryPos distance _spawnPosHeli3 < _deliveryPos distance _chosenSpawnPos) then {
	_chosenSpawnPos = _spawnPosHeli3;
	diag_log "Chose _spawnPosHeli3";
};


//_helipadPosition = [_deliveryPos, 0, 3, 5, 1, 2000, 0] call BIS_fnc_findSafePos;
//_helipad = "Land_HelipadSquare_F" createVehicle _deliveryPos;
_helipad = "Land_HelipadEmpty_F" createVehicle _deliveryPos;

_group = createGroup civilian;
_group setCombatMode "BLUE";
_group setBehaviour "SAFE";
_group allowFleeing 0;

_pilot = [_group, _spawnPosPilot] call createRandomPilot; 

_heli = createVehicle ["I_Heli_Transport_02_F", _chosenSpawnPos, [], 0, "FLY"];
_heli addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];

_pilot moveInDriver _heli;
_group addVehicle _heli;


diag_log format["_Heli bounding box: %1", boundingBox _heli];
diag_log format["_Veh bounding box: %1", boundingBox _veh];

_heliFloor = boundingBox _heli select 0 select 2;
_vehHeight = abs (boundingBox _veh select 0 select 2);

_veh attachTo [_heli, [0, 0, -6]];

if (alive _veh) then {
	diag_log "Vehicle alive after attach";
};

_wp = _group addWaypoint [_hoverPos, 1];
[_group, 1] setWaypointType "MOVE";
[_group, 1] setWaypointSpeed "FULL";
//_wp setWaypointStatements ["true", "diag_log 'At _hoverPos';"];
[_group, 1] setWaypointCompletionRadius 10;

_wp = _group addWaypoint [_deliveryPos, 2];
[_group, 2] setWaypointType "MOVE";
[_group, 2] setWaypointSpeed "LIMITED";
[_group, 2] setWaypointCompletionRadius 10;

diag_log "Heli should now be en route";

// Mark it up
_marker = createMarker ["Airdrop", position leader _group];
_marker setMarkerType "mil_pickup";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Airdrop";

_done = false;
_heliNeedsDeleting = false;

_count = 0;

waitUntil
{
    diag_log format ["Distance is now %1", _heli distance _deliveryPos];

    _marker setMarkerPos (position leader _group);

    if (!alive _heli || _count > 60) then {
    	_heliNeedsDeleting = true;
    	_done = true;
    };

    if (_heli distance _deliveryPos < 300) then {
    	_heli flyInHeight 40;
    	_heli limitSpeed 30;
    };

    if (_heli distance _deliveryPos < 50) then {
		_heli land "GET IN";
    };

    if (getPosATL _veh select 2 < 8 && _heli distance _deliveryPos < 50) then {
    	diag_log "Detatching vehicle";
    	detach _veh;
    	_done = true;
    };

    _count = _count + 1;

    sleep 2;

    _done
};

deleteVehicle _helipad;

if (!_heliNeedsDeleting) then {
	_heli land "NONE";

	diag_log "Chopper off!";

	deleteWaypoint [_group, 1];
	deleteWaypoint [_group, 2];

	_wp = _group addWaypoint [_chosenSpawnPos, 1];
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointSpeed "FULL";
	_wp setWaypointStatements ["true", "diag_log 'At _spawnPosHeli';"];

	_finished = false;
	_count = 0;
	waitUntil
	{
	    _marker setMarkerPos (position leader _group);

	    _count = _count + 1;
	    diag_log format ["Egress _count is %1", _count];

	    // If its close enough...
	    if (_heli distance _chosenSpawnPos < 100) then { 
	    	_finished = true;
	    };

	    sleep 2;

	    _finished || _count > 20
	};

	// Remove the heli now
	deleteVehicle _heli;	
} else {
	deleteVehicle _heli;
}

// Cleanup if the heli is dead or otherwise
{deleteVehicle _x;}forEach units _group; 
deleteGroup _group; 
deleteMarker _marker;
