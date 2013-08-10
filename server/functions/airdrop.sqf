//  @file Version: 1.0
//  @file Name: airdrop.sqf
//  @file Author: [KoS]Bewilderbeest
//  @file Created: 07/28/2013 14:32
//  @file Desc: Delivers a vehicle by airdrop, or a self-delivering helo

// 1st arg is the vehicle object
// 2nd arg is destination position
// 3rd arg is the player who ordered the vehicle
// 4th arg is the cost of the vehicle
// 5th arg is the store owner (for locking)

#include "defines.hpp"

#define AIRDROP_TYPE_AIRDROP 1
#define AIRDROP_TYPE_SELF_DELIVERY 2

if(!isServer) exitWith {};

private ["_veh", "_heli", "_deliveryPos", "_customer", "_price", "_vehStoreOwner", "_customerUID", "_dropoffType", "_spawnPosHeli1", "_spawnPosHeli2", "_spawnPosHeli3", "_chosenSpawnPos", "_airdropHeliNumber", "_helipad", "_daytime", "_light1", "_group", "_pilot", "_wp1", "_markerDropoff", "_markerHeli", "_done", "_refundNeeded", "_count", "_landingMode"];

if (count _this == 0) exitWith { };

//diag_log format ["Airdrop args are: %1", _this];

_veh = _this select 0;
_deliveryPos = _this select 1;
_customer = _this select 2;
_price = _this select 3;
_vehStoreOwner = _this select 4;

_customerUID = getPlayerUID _customer;

if (isNil "_veh" or isNil "_deliveryPos") exitWith { diag_log format["ERROR: _veh was %1 and _deliveryPos was %2", _veh, _deliveryPos]; }; 

_dropoffType = AIRDROP_TYPE_AIRDROP;
if (_veh isKindOf "Helicopter") then { 
    //diag_log "_dropoffType = selfdelivery. No airdrop!";
    _dropoffType = AIRDROP_TYPE_SELF_DELIVERY;
} else {
    //diag_log "Its not a heli, so _dropoffType is airdrop";
};

_spawnPosHeli1 = (getMarkerPos "airdrop_heli_spawn_1");
_spawnPosHeli1 set [2, 220]; // 220m up

_spawnPosHeli2 = (getMarkerPos "airdrop_heli_spawn_2");
_spawnPosHeli2 set [2, 220];
_spawnPosHeli3 = (getMarkerPos "airdrop_heli_spawn_3");
_spawnPosHeli3 set [2, 220];

_spawnPosPilot = [3786.45,7912.79,17.5];

// Find the closest spawn point
_chosenSpawnPos = _spawnPosHeli1;
_airdropHeliNumber = 1;

//diag_log format ["Testing spawnpos2 %1 vs _chosenSpawnPos %2", _deliveryPos distance _spawnPosHeli2, _deliveryPos distance _chosenSpawnPos];

if (_deliveryPos distance _spawnPosHeli2 < _deliveryPos distance _chosenSpawnPos) then {
    _chosenSpawnPos = _spawnPosHeli2;
    _airdropHeliNumber = 2;
    //diag_log "Chose _spawnPosHeli2";
};

//diag_log format ["Testing spawnpos3 %1 vs _chosenSpawnPos %2", _deliveryPos distance _spawnPosHeli3, _deliveryPos distance _chosenSpawnPos];

if (_deliveryPos distance _spawnPosHeli3 < _deliveryPos distance _chosenSpawnPos) then {
    _chosenSpawnPos = _spawnPosHeli3;
    _airdropHeliNumber = 3;
    //diag_log "Chose _spawnPosHeli3";
};

// Landing pad for the vehicle
_helipad = "Land_HelipadEmpty_F" createVehicle _deliveryPos;
//_helipad = "Land_HelipadSquare_F" createVehicle _deliveryPos;


// Spawn in smoke or chemlights depending on time of day
_daytime = daytime;
if (_daytime > 6 && _daytime < 19) then {
    _light1 = "SmokeShellBlue" createVehicle (getPos _helipad);
} else {
    _light1 = "Chemlight_yellow" createVehicle (getPos _helipad);
};

_deliveryPos = position _helipad; // reset according to new helipad location

//diag_log format ["Helipad position ASL is %1", getPosASL _helipad];

_group = createGroup side _customer;
_pilot = [_group, _spawnPosPilot] call createRandomPilot; 
_pilot setBehaviour "CARELESS";

_heli = nil;

if (_dropoffType == AIRDROP_TYPE_SELF_DELIVERY) then {
    _chosenSpawnPos set [2, (floor random 200) + 100]; // up high
    //diag_log format["Moving vehicle to _chosenSpawnPos %1", _chosenSpawnPos];
    _pilot moveInDriver _veh;
    _group addVehicle _veh;
    _veh setpos [_chosenSpawnPos select 0, _chosenSpawnPos select 1, _chosenSpawnPos select 2];
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

// Waypoint for initial navigation before the land command

_wp1 = _group addWaypoint [position _helipad, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "FULL";
_wp1 setWaypointBehaviour "CARELESS";
//_wp1 setWaypointStatements ["true", "diag_log 'At _wp1';"];
_wp1 setWaypointCompletionRadius 20;

//diag_log "Heli should now be en route";

// Mark it up
_markerHeli = createMarker [format ["airdrop_heli_%1_%2",_airdropHeliNumber, floor random 300], position leader _group];
_markerHeli setMarkerType "mil_pickup";
_markerHeli setMarkerSize [1, 1];
_markerHeli setMarkerColor "ColorGreen";
if (_dropoffType == AIRDROP_TYPE_AIRDROP) then {
    _markerHeli setMarkerText "Transport Helo";
} else {
    _markerHeli setMarkerText "Autonomous Helo";
};

// Second marker for the dropoff point
_markerDropoff = createMarker [format ["airdrop_dest_%1_%2",_airdropHeliNumber, floor random 300], _deliveryPos];
_markerDropoff setMarkerType "mil_end";
_markerDropoff setMarkerSize [1, 1];
_markerDropoff setMarkerColor "ColorGreen";
_markerDropoff setMarkerText "Dropoff";

_done = false; // Exit cond
_refundNeeded = false; // Whether the player gets a refund or not
_count = 0; // Timeout counter
_landingMode = false; // Latch

waitUntil
{
    //diag_log format ["LZ distance: %1, Vehicle height: %2, Cur WP: %3, Count: %4, Damage: %5", _heli distance _helipad, position _veh select 2, currentWaypoint _group, _count, damage _heli];

    sleep 1;

    _heli flyinHeight 50;

    _markerHeli setMarkerPos (position leader _group);

    // If its shot down or timed out, exit
    if (!alive _heli || _count > 240) then {
        //diag_log "Heli was destroyed or timed out!";
        _refundNeeded = true;
        _done = true;
    };

    // If we're close, start slowing down
    if (_heli distance _deliveryPos < 200) then {
        //diag_log format ["Force speed set 30 (is %1)", speed _heli];
        _heli forceSpeed 30;
        _heli limitSpeed 30;
    };

    // If we're very near, start landing
    if (!_landingMode && _heli distance _deliveryPos < 200) then {
        //diag_log format ["Triggering landing mode"];
        deleteWaypoint _wp1;
        _heli land "LAND";
        _landingMode = true;
    };

    // If we're self delivering, its different from airdrops
    if (_dropoffType == AIRDROP_TYPE_SELF_DELIVERY) then { 
        if (_landingMode && position _veh select 2 < 2) then {
            _done = true;
        };
    } else {
        if (_landingMode && position _veh select 2 < 8 && _heli distance _helipad < 30) then {
            //diag_log "Detatching vehicle";
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
deleteMarker _markerDropoff;
deleteVehicle _light1;
deleteVehicle _helipad;

// Unlock the vehicle store owner to allow new purchases
_vehStoreOwner setVariable['isDeliveringVehicle', nil, true];

// Make sure the vehicle is OK
sleep 1;
_veh setDamage 0;
_veh allowDamage true;

// If we don't need to refund, send the chopper off on its way
if (!_refundNeeded && _dropoffType == AIRDROP_TYPE_AIRDROP) then {
    //diag_log "Chopper off!";

    _heli flyinHeight 150;
    _heli forceSpeed 200;
    _heli limitSpeed 200;

    _wp2 = _group addWaypoint [_chosenSpawnPos, 0];
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointSpeed "FULL";
    //_wp2 setWaypointStatements ["true", "diag_log 'At _chosenSpawnPos';"];
    _wp2 setWaypointCompletionRadius 50;
    
    _finished = false;
    _count = 0;
    waitUntil
    {
        _markerHeli setMarkerPos (position leader _group);

        _count = _count + 1;
        //diag_log format ["Distance to WP: %1, Egress timeout is %2", _heli distance _chosenSpawnPos, _count];

        // If its close enough...
        if (_heli distance _chosenSpawnPos < 100) then { 
            _finished = true;
        };

        sleep 2;

        _finished || _count > 30
    };
};

if (_refundNeeded) then {
    //diag_log "Refund time!";
    // If it was an airlift, ensure the other vehicle is dead
    if (_dropoffType == AIRDROP_TYPE_AIRDROP) then {
        //diag_log "Killing ordered vehicle";
        _veh setDamage 1;
    };

    _refundPercentage = 65;
    _refund = (_price / 100.0) * _refundPercentage;
    _playerMoney = _customer getVariable __MONEY_VAR_NAME__;
    _customer setVariable[__MONEY_VAR_NAME__,_playerMoney + _refund,true];

    // Break the bad news!

    _msg = format["KoS regret to inform you your vehicle was lost or damaged in transit. Please accept a %1 percent refund on the purchase cost.", _refundPercentage];
    clientRelaySystem = [MESSAGE_BROADCAST_MSG_TO_PLAYER, MESSAGE_BROADCAST_MSG_TYPE_GCHAT, _customerUID, _msg];
    //diag_log format ["Set clientRelaySystem to %1", clientRelaySystem];
    publicVariable "clientRelaySystem";
    //diag_log format["VEHICLE REFUND TRIGGERED: %1 tried to buy a %2", name _customer, name _veh];
};

if (_dropoffType == AIRDROP_TYPE_AIRDROP) then {
    deleteVehicle _heli;
};

// Cleanup if the heli is dead or otherwise
{deleteVehicle _x;}forEach units _group;
deleteGroup _group; 
deleteMarker _markerHeli;
