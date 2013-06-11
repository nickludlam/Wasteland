//	@file Version: 1.1
//	@file Name: vehicleSpawning.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, modded by AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_counter", "_placed"];

_counter = 0;
_placed = [0];
for "_i" from 1 to 85 do
{
	_x = floor (random 195);
	while{_x in _placed} do
	{
		_x = floor (random 195);
	};
	//_x = floor (random 195);
	[getMarkerPos format ["Spawn_%1", _x]] call vehicleCreation;
	_placed set [_i, _x];
	_counter = _counter + 1;
};

diag_log format["WASTELAND SERVER - %1 Vehicles Spawned",_counter];
