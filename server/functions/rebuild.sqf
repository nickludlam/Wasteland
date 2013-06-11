//place markers on the map called buildrep_1, buildrep_2...etc
//this function will monitor those every 30 minutes and repair the buildings
if(!X_Server) exitWith {};

private ["_pos", "_dist", "_static", "_run"];

_run = true;
while{_run} do
{
	sleep 1500;
	//sleep 1;
	for "_i" from 0 to 30 do
	{
		_pos =	(getMarkerPos format ["buildrep_%1", _i]);
		_dist = 100;
	
		_static = nearestobjects [_pos,["Building", "Land_Cargo20_Military_F", "Land_Cargo_Patrol_V1_F"], _dist];	
		{ 
			_x setDamage 0;
		} foreach _static;
	};
	
	//[] ExecVM "server\functions\initStoreOwners.sqf";
 };