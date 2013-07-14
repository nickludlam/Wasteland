//	@file Version: 1.1
//	@file Name: objectCreation.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS]Bewilderbeest
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args: position, array of objects

if(!X_Server) exitWith {};

_objPos = _this select 0;
_category = this select 1;

// If we're spawning a specific thing, choose it from the specified category/array here
if (!isNil "_category") then {
	_Objtype = _category select (random (count objectList - 1));
} else {
	// Normal totally random obj
	_Objtype = objectList select (random (count objectList - 1));
};

_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj addeventhandler ["hit", {(_this select 0) setdamage 0;}];
_obj addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];

switch (_Objtype) do
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
