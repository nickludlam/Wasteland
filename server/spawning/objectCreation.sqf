//	@file Version: 1.1
//	@file Name: objectCreation.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS]Bewilderbeest
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args: position, array of objects
private ["_objPos", "_objType","_specificObjects","_obj"];
if(!X_Server) exitWith {};

_objPos = _this select 0;
_specificObjects = _this select 1;

_objType = objectList select (random (count objectList - 1));
if (!isNil "_specificObjects") then {
	// If we're spawning a specific thing, choose it from the specified category/array here
	_objType = _specificObjects select (random (count _specificObjects - 1));
};

diag_log format ["Creating %1 at %2", _objType, _objPos];

_obj = createVehicle [_objType,_objPos,[],50,"None"];
_obj addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_obj addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];

// Handle any specific object type properties here
switch (_objType) do
{
	case "Land_CanisterPlastic_F": {
    	_obj setVariable["water",20,true];
	};
	case "Land_Sacks_goods_F": {
    	_obj setVariable["food",20,true];
	};
};

_obj setVariable["R3F_LOG_disabled",false];
_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
