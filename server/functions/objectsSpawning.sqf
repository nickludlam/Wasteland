//	@file Version: 1.0
//	@file Name: objectsSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, His_Shadow
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter","_pos","_markerName","_marker","_amountOfVehicles","_hint","_placed","_savedObjectsCount","_totalToSpawn"];
_counter = 0;
_placed = [0];
_savedObjectsCount = count ActiveObjects;
_totalToSpawn = 134;
_totalToSpawn = _totalToSpawn - _savedObjectsCount;
for "_i" from 1 to 134 do
{
    _x = floor (random 195);
	while{_x in _placed} do
	{
		_x = floor (random 195);
	};
    _pos = getMarkerPos format ["Spawn_%1", _x];
    
    _newpos = [_pos, 21, 40, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    [_newpos, nil] call objectCreation; 
    _placed set [_i, _x];
    _counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Objects Spawned",_counter];
