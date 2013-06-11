if(!X_Server) exitWith {};

private ["_pos", "_dist", "_static", "_run"];
for "_i" from 0 to 30 do
{
	_pos =	(getMarkerPos format ["buildrep_%1", _i]);
	_dist = 100;

	_static = nearestobjects [_pos,["Building", "Land_Cargo20_Military_F", "Land_Cargo_Patrol_V1_F"], _dist];	
	{ 
		_x setDamage 0;
	} foreach _static;
};

//spawn initGunStores;
//[] ExecVM "server\functions\initStoreOwners.sqf";