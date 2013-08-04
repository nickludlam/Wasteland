//	@file Version: 1.0
//	@file Name: airdrop.sqf
//	@file Author: [KoS]Bewilderbeest
//	@file Created: 07/28/2013 14:32
//	@file Desc: Delivers a vehicle by airdrop, or a self-delivering helo

// 1st arg is the vehicle object
// 2nd arg is destination position
// 3rd arg is the player who ordered the vehicle
// 4th arg is the cost of the vehicle
// 5th arg is the store owner (for locking)

#include "defines.hpp"

#define AIRDROP_TYPE_AIRDROP 1
#define AIRDROP_TYPE_SELF_DELIVERY 2

if(!isServer) exitWith {};

private ["_deliveryPos", "_vehType", "_customer", "_colorText", "_veh", "_heli", "_spawnPosHeli", "_spawnPosVehicle", "_group", "_pilot", "_done", "_wp"];

if (count _this == 0) exitWith { };

diag_log format ["Airdrop args are: %1", _this];

_veh = _this select 0;
_deliveryPos = _this select 1;
_customer = _this select 2;
_price = _this select 3;
_vehStoreOwner = _this select 4;

if (isNil "_veh" or isNil "_deliveryPos") exitWith { diag_log format["ERROR: _veh was %1 and _deliveryPos was %2", _veh, _deliveryPos]; }; 

if (alive _veh) then {
	diag_log "Vehicle alive at start";
};

_dropoffType = AIRDROP_TYPE_AIRDROP;
if (_veh isKindOf "Helicopter") then { 
	diag_log "_dropoffType = selfdelivery. No airdrop!";
	_dropoffType = AIRDROP_TYPE_SELF_DELIVERY;
} else {
	diag_log "Its not a heli, so _dropoffType is airdrop";
};

_spawnPosHeli1 = (getMarkerPos "airdrop_heli_spawn_1");
_spawnPosHeli1 set [2, 220]; // 220m up

_spawnPosHeli2 = (getMarkerPos "airdrop_heli_spawn_2");
_spawnPosHeli2 set [2, 220];
_spawnPosHeli3 = (getMarkerPos "airdrop_heli_spawn_3");
_spawnPosHeli3 set [2, 220];

_spawnPosPilot = [3786.45,7912.79,17.5];

_spawnPosHelis = [_spawnPosHeli1, _spawnPosHeli2, _spawnPosHeli3];

// Find the closest spawn point
_chosenSpawnPos = _spawnPosHeli1;
_airdropHeliNumber = 1;

diag_log format ["Testing spawnpos2 %1 vs _chosenSpawnPos %2", _deliveryPos distance _spawnPosHeli2, _deliveryPos distance _chosenSpawnPos];

if (_deliveryPos distance _spawnPosHeli2 < _deliveryPos distance _chosenSpawnPos) then {
	_chosenSpawnPos = _spawnPosHeli2;
	_airdropHeliNumber = 2;
	diag_log "Chose _spawnPosHeli2";
};

diag_log format ["Testing spawnpos3 %1 vs _chosenSpawnPos %2", _deliveryPos distance _spawnPosHeli3, _deliveryPos distance _chosenSpawnPos];

if (_deliveryPos distance _spawnPosHeli3 < _deliveryPos distance _chosenSpawnPos) then {
	_chosenSpawnPos = _spawnPosHeli3;
	_airdropHeliNumber = 3;
	diag_log "Chose _spawnPosHeli3";
};

//_helipad = "Land_HelipadEmpty_F" createVehicle _deliveryPos;
_helipad = "Land_HelipadSquare_F" createVehicle _deliveryPos;

_light1 = "#lightpoint" createVehicle (position _helipad);
_light1 setLightBrightness 0.2; // ?
_light1 setLightAmbient [255, 200, 0]; // Ambient colour of the light.
_light1 setLightColor [255, 200, 0]; // Colour of the light point and immediate surroundings.
_light1 setLightIntensity 0.5;  // Effects the distance ambient can be seen from.
_light1 lightAttachObject [_helipad, [4, -4, 0.2]]; // Array: Left/Right, Forward/Backward, Up/Down.

_light2 = "#lightpoint" createVehicle  (position _helipad);
_light2 setLightBrightness 0.2; // ?
_light2 setLightAmbient [255, 200, 0]; // Ambient colour of the light.
_light2 setLightColor [255, 200, 0]; // Colour of the light point and immediate surroundings.
_light2 setLightIntensity 0.5;  // Effects the distance ambient can be seen from.
_light2 lightAttachObject [_helipad, [4, 4, 0.2]]; // Array: Left/Right, Forward/Backward, Up/Down.

_light3 = "#lightpoint" createVehicle  (position _helipad);
_light3 setLightBrightness 0.2; // ?
_light3 setLightAmbient [255, 200, 0]; // Ambient colour of the light.
_light3 setLightColor [255, 200, 0]; // Colour of the light point and immediate surroundings.
_light3 setLightIntensity 0.1;  // Effects the distance ambient can be seen from.
_light3 lightAttachObject [_helipad, [-4, 4, 0.2]]; // Array: Left/Right, Forward/Backward, Up/Down.

_light4 = "#lightpoint" createVehicle  (position _helipad);
_light4 setLightBrightness 0.2; // ?
_light4 setLightAmbient [255, 200, 0]; // Ambient colour of the light.
_light4 setLightColor [255, 200, 0]; // Colour of the light point and immediate surroundings.
_light4 setLightIntensity 0.5;  // Effects the distance ambient can be seen from.
_light4 lightAttachObject [_helipad, [-4, -4, 0.2]]; // Array: Left/Right, Forward/Backward, Up/Down.

_deliveryPos = position _helipad; // reset according to new helipad location

diag_log format ["Helipad position ASL is %1", getPosASL _helipad];

_group = createGroup side _customer;
_pilot = [_group, _spawnPosPilot] call createRandomPilot; 
_pilot setBehaviour "CARELESS";

if (_dropoffType == AIRDROP_TYPE_SELF_DELIVERY) then {
	_safeSpawnPos = [_chosenSpawnPos,5,100,20,0,0,0] call BIS_fnc_findSafePos;
	_safeSpawnPos set [2, (floor random 1000) + 200]; // up high

	diag_log format["Moving vehicle to safeSpawnPos %1", _safeSpawnPos];
	_veh setpos _safeSpawnPos;
	_pilot moveInDriver _veh;
	_group addVehicle _veh;
	_heli = _veh;
} else {
	_heli = createVehicle ["I_Heli_Transport_02_F", _chosenSpawnPos, [], 0, "FLY"];
	_heli addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
	
	_pilot moveInDriver _heli;
	_group addVehicle _heli;
	_heli disableCollisionWith _veh;

	_veh attachTo [_heli, [0, 0, -10]];
};

_pilot action ["lightOn", _heli];

_group setCombatMode "BLUE";
_group setBehaviour "SAFE";
_group allowFleeing 0;

diag_log format["vehicle position is %1", position _veh];

//diag_log format["_Heli bounding box: %1", boundingBox _heli];
//diag_log format["_Veh bounding box: %1", boundingBox _veh];

//_heliFloor = boundingBox _heli select 0 select 2;
//_vehHeight = abs (boundingBox _veh select 0 select 2);

// Find a point out from the delivery pos for the heli to slow down at
//_dir = [_deliveryPos, _chosenSpawnPos] call BIS_fnc_dirTo;
//_slowdownPos = [_deliveryPos, 300,_dir] call BIS_fnc_relPos;
//_slowdownPos set [2, 40]; // Lower

_wp1 = _group addWaypoint [position _helipad, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointStatements ["true", "diag_log 'At _wp1';"];
_wp1 setWaypointCompletionRadius 20;

diag_log "Heli should now be en route";

// Mark it up
_marker = createMarker [format ["airdrop_heli_%1_%2",_airdropHeliNumber, floor random 300], position leader _group];
_marker setMarkerType "mil_pickup";
_marker setMarkerSize [1, 1];
_marker setMarkerColor "ColorGreen";
if (_dropoffType == AIRDROP_TYPE_SELF_DELIVERY) then {
	_marker setMarkerText "Transport Helo";
} else {
	_marker setMarkerText "Autonomous Helo";
};

_marker2 = createMarker [format ["airdrop_dest_%1_%2",_airdropHeliNumber, floor random 300], _deliveryPos];
_marker2 setMarkerType "mil_end";
_marker2 setMarkerSize [1, 1];
_marker2 setMarkerColor "ColorGreen";
_marker2 setMarkerText "Dropoff";

_done = false;
_heliWasDestroyed = false;

_count = 0; // timeout counter
_landingMode = false;

waitUntil
{
    diag_log format ["LZ distance: %1, Vehicle height: %2, Cur WP: %3, Count: %4", _heli distance _helipad, position _veh select 2, currentWaypoint _group, _count];

    sleep 1;

    // Toggle light
    if (_count % 2 == 0) then {
    	_light1 setLightBrightness 0.000;
    	_light2 setLightBrightness 0.2;
    	_light3 setLightBrightness 0.000;
    	_light4 setLightBrightness 0.2;
    } else {
    	_light1 setLightBrightness 0.2;
    	_light2 setLightBrightness 0.000;
    	_light3 setLightBrightness 0.2;
    	_light4 setLightBrightness 0.000;
    };

	_heli flyinHeight 50;

    _marker setMarkerPos (position leader _group);

    if (!alive _heli) then {
    	diag_log "Heli was destroyed!";
    	_heliWasDestroyed = true;
    	_done = true;
    };
    if (_count > 180) then {
    	diag_log "Delivery timeout!";
    	_done = true;
    };

    if (_heli distance _deliveryPos < 200) then {
    	diag_log format ["Force speed set 30 (is %1)", speed _heli];
		_heli forceSpeed 30;
		_heli limitSpeed 30;
    };

    if (!_landingMode && _heli distance _deliveryPos < 200) then {
  	    diag_log format ["Triggering landing mode"];
    	deleteWaypoint _wp1;
		_heli land "LAND";
		_landingMode = true;
    };

    if (_dropoffType == AIRDROP_TYPE_SELF_DELIVERY) then { 
    	if (_landingMode && position _veh select 2 < 2) then {
	    	_done = true;
    	};
    } else {
	    if (_landingMode && position _veh select 2 < 8 && _heli distance _helipad < 40) then {
	    	diag_log "Detatching vehicle";
	    	_veh allowDamage false;
	    	detach _veh;
	  		_heli land "NONE";
	    	_done = true;
	    };
	};

    _count = _count + 1;

    _done
};

// Dropoff is now complete
deleteMarker _marker2;
deleteVehicle _light1;
deleteVehicle _light2;
deleteVehicle _light3;
deleteVehicle _light4;
deleteVehicle _helipad;

_vehStoreOwner setVariable['isDeliveringVehicle', nil, true];

// Make sure the vehicle is OK
sleep 1;
_veh setDamage 0; 
_veh allowDamage true;

if (!_heliWasDestroyed && _dropoffType == AIRDROP_TYPE_AIRDROP) then {
	diag_log "Chopper off!";

	_heli flyinHeight 250;
	_heli forceSpeed 200;
	_heli limitSpeed 200;

	_wp2 = _group addWaypoint [_chosenSpawnPos, 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointSpeed "FULL";
	_wp2 setWaypointStatements ["true", "diag_log 'At _chosenSpawnPos';"];
	_wp2 setWaypointCompletionRadius 50;
	
	_finished = false;
	_count = 0;
	waitUntil
	{
	    _marker setMarkerPos (position leader _group);

	    _count = _count + 1;
	    //diag_log format ["Distance to WP: %1, Egress timeout is %2", _heli distance _chosenSpawnPos, _count];

	    // If its close enough...
	    if (_heli distance _chosenSpawnPos < 100) then { 
	    	_finished = true;
	    };

	    sleep 2;

	    _finished || _count > 40
	};

	// Remove the heli now
};

if (_heliWasDestroyed) then {
	diag_log "Refund time!";
	// If it was an airlift, ensure the other vehicle is dead
	if (_dropoffType == AIRDROP_TYPE_AIRDROP) then {
		diag_log "killing ordered vehicle";
		_veh setDamage 1;
	};

	_refundPercentage = 50;
	_refund = (_price / 100.0) * _refundPercentage;
	_playerMoney = _customer getVariable __MONEY_VAR_NAME__;
	_customer setVariable[__MONEY_VAR_NAME__,_playerMoney + _refund,true];

	// Break the bad news!
	_destPlayerUID = getPlayerUID _customer;
	_msg = format["KoS regret to inform you your vehicle was damaged in transit. Please accept a %1% refund on the purchase cost.", _refundPercentage];
	clientRelaySystem = [MESSAGE_BROADCAST_MSG_TO_PLAYER, MESSAGE_BROADCAST_MSG_TYPE_GCHAT, _destPlayerUID, _msg];
	diag_log format ["Sending clientRelaySystem %1", clientRelaySystem];
	publicVariable "clientRelaySystem";
};

if (_dropoffType == AIRDROP_TYPE_AIRDROP) then {
	deleteVehicle _heli;
};

// Cleanup if the heli is dead or otherwise
{deleteVehicle _x;}forEach units _group;
deleteGroup _group; 
deleteMarker _marker;
