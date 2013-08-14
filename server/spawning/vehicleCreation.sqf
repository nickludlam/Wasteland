
//	@file Version: 1.1
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, modded by AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args: markerPos [, carType]

if(!X_Server) exitWith {};

private ["_markerPos","_pos","_type","_num","_cartype","_car", "_color"];

_markerPos = _this select 0;

if (count _this > 1) then
{
	_cartype = _this select 1;
	
	if (_cartype in civilianVehicles) then { _type = 0 };
	if (_cartype in lightMilitaryVehicles) then { _type = 1 };
	if (_cartype in mediumMilitaryVehicles) then { _type = 2 };
}
else
{
	_num = floor (random 100);
	if (_num < 100) then { _cartype = civilianVehicles call BIS_fnc_selectRandom; _type = 0 };
	if (_num < 70) then { _cartype = lightMilitaryVehicles call BIS_fnc_selectRandom; _type = 1 };
	if (_num < 25) then { _cartype = civilianVehicles call BIS_fnc_selectRandom; _type = 0 };
	//if (_num < 25) then { _cartype = mediumMilitaryVehicles call BIS_fnc_selectRandom; _type = 2 };
};

//_pos = [_markerPos, random 25, 35, ( if (_type == 1) then { 2 } else { 5 } ), 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_pos = [_markerPos, 1, 35, ( if (_type == 1) then { 2 } else { 5 } ), 0, 60 * (pi / 180), 0, [], [_markerPos]] call BIS_fnc_findSafePos;

//Car Initialization
_car = createVehicle [_cartype,_pos, [], 0, "None"];

//Clear Cars Inventory
clearMagazineCargoGlobal _car;
clearWeaponCargoGlobal _car;

//Set Cars Attributes
_car setFuel (0.2 + random 0.40);
//_car setDamage (random 0.50);
_car setDir (random 360);
if (_type > 1) then { _car setVehicleAmmo (random 0.90) };
//_car disableTIEquipment true;
[_car] call randomWeapons;

//Set original posistion then add to vehicle array
_car setVariable ["newVehicle",1,true];
_car setPosATL [getpos _car select 0,getpos _car select 1,1];
_car setVelocity [0,0,0];
_car addEventHandler ["IncomingMissile", "[name (_this select 2)] execVM 'incomingAlarm.sqf'"];
_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];

if(_cartype == "B_MRAP_01_F") then
{
	_color = 0;
	_color = floor(random 7);
	switch(_color) do
	{
		case 1:
		{
			_car setObjectTexture [0, "images\camo_fack.jpg"];
		};
		case 2:
		{
			_car setObjectTexture [0, "images\camo_deser.jpg"];
		};
		case 3:
		{
			_car setObjectTexture [0, "images\camo_fuel.jpg"];
		};
		case 4:
		{
			_car setObjectTexture [0, "images\camo_pank.jpg"];
		};
		default{};
	};
};

// Unit, delay, deserted, respawns, explode, static
[_car, 120, 3600, 0, false, _markerPos] execVM "server\functions\vehicle.sqf"; //2 Minutes (Desired)
//[_car, 1, 3600, 0, false, _markerPos] execVM "server\functions\vehicle.sqf"; //Immediate (TESTING)
