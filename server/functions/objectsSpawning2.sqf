//	@file Version: 1.0
//	@file Name: objectsSpawning2.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter", "_comestibleBias", "_pos","_newpos"];
_counter = 0;
_comestibleBias = 0.05;

for "_i" from 1 to 118 do
{
     _x = floor (random 195);
    _pos = getMarkerPos format ["Spawn_%1", _x];
    
    _newpos = [_pos, 31, 50, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

	if (random 1 <= _comestibleBias) then {
		diag_log format["Spawning food or water for iter %1", _counter];
	    [_newpos, comestibleList] call objectCreation;
	} else {
	    [_newpos, nil] call objectCreation; 
	};
    
    _counter = _counter + 2;
};

diag_log format["WASTELAND SERVER - %1 Extra Objects Spawned",_counter];
