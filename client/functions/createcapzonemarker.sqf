//	@file Version: 1.0
//	@file Name: createGunStoreMarkers.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap,[FN]Fackstah
//	@file Args:

_radius = 200;
_status = [];
_capzone = ["cap1", "cap2", "cap3","cap4", "cap5", "cap6","cap7", "cap8", "cap9","cap10", "cap11", "cap12","cap13", "cap14", "cap15","cap16", "cap17", "cap18","cap19"];
_col_empty = "";
_col_enemy = "";
_col_friendly = "";
_col_mixed = "";

//Creates the markers around gunstores.
waitUntil {{!isNull(missionNamespace getVariable _x) && ((getPos(missionNamespace getVariable _x) distance [0,0,0]) > 100)} count _capzone == count _capzone};
{
	_unit = missionNamespace getVariable _x;


//Used to set the status of each store.
_setStatus = {
	if(_status select (_this select 0) == (_this select 1)) exitWith {};

	_markerNameZone = format ["marker_shop_zone_%1", _capzone select (_this select 0)];
	_markerNameDescription = format ["marker_shop_desc_%1", _capzone select (_this select 0)];
	switch(_this select 1) do {
		case "EMPTY": {
			_markerNameZone setmarkerColorLocal _col_empty;
			_markerNameDescription setmarkerColorLocal _col_empty;

		};
		case "ENEMY": {
			_markerNameZone setmarkerColorLocal _col_enemy;
			_markerNameDescription setmarkerColorLocal _col_enemy;

		};
		case "FRIENDLY": {
			_markerNameZone setmarkerColorLocal _col_friendly;
			_markerNameDescription setmarkerColorLocal _col_friendly;

		};
		case "MIXED": {
			_markerNameZone setmarkerColorLocal _col_mixed;
			_markerNameDescription setmarkerColorLocal _col_mixed;
		};
	};

	if((_this select 2) && ((_this select 1) in ["ENEMY", "MIXED"])) then {
		hintSilent parseText format ["<t size='2' color='#ff0000'>%1</t><br/><br/>%2.","Warning!","Enemy player just entered the area"];


	_status set [_this select 0, _this select 1];
};

//Check each store to see if their state has changed and then calls the update function to make the display the correct state.
showmarkers = true;
while {showmarkers} do {
    {
    	_unit = missionNamespace getVariable (_capzone select _forEachIndex);
		_friendlyCount = 0;
		_enemyCount = 0;
		{
			if((_x distance _unit < _radius) && (player != _x)) then {
				if(playerSide in [west,east] && playerSide == side _x) then {
					_friendlyCount = _friendlyCount + 1;
				} else {
					_enemyCount = _enemyCount + 1;
				};
			};
		} forEach playableUnits;

		if(player distance _unit < _radius) then {
			if(_enemyCount > 0) then {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "MIXED", true] call _setStatus;
				} else {
					[_forEachIndex, "ENEMY", true] call _setStatus;
				};
			} else {
				[_forEachIndex, "FRIENDLY", true] call _setStatus;
			};
		} else {
			if(_enemyCount > 0) then {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "MIXED", false] call _setStatus;
				} else {
					[_forEachIndex, "ENEMY", false] call _setStatus;
				};
			} else {
				if(_friendlyCount > 0) then {
					[_forEachIndex, "FRIENDLY", false] call _setStatus;
				} else {
					[_forEachIndex, "EMPTY", false] call _setStatus;
				};
			};
		};    
    }forEach _capzone;
	sleep 1;
};
