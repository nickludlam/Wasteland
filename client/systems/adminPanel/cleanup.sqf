{if (_x isKindOf "Man") then {deleteVehicle _x}} forEach allDead;
{if (damage _x == 1 and _x isKindOf "Car") then {deleteVehicle _x}} foreach vehicles;

//private ["_delcode", "_currentworld", "_oldworld", "_newworld", "_notalive"];
//_delcode = {
//	private ["_crew"];
//	sleep 1;
//	{
//		if (not isNull _x) then {
//			if (_x isKindOf "Ship" or _x isKindOf "Air" or _x isKindOf "LandVehicle") then {
//				_crew = nearestObjects [_x, ["Man"], 20];
//				_crew = _crew + crew _x;
//				deleteVehicle _x;
//				{
//					if (not alive _x) then {deleteVehicle _x};
//				} forEach _crew;
//			} else {
//				deleteVehicle _x;
//			};
//		};
//	} forEach _this;
//};
//_currentworld = [];
//sleep 1;
//_oldworld = _currentworld;
//_currentworld = + list wholeworld;
//_newworld = _oldworld - _currentworld;
//_notalive = [];
//{
//	if (not alive _x) then {_notalive = _notalive + [_x]};
//} forEach _newworld;
//if (count _notalive > 0) then {_notalive spawn _delcode};

