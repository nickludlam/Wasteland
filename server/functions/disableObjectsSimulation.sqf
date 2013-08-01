private ["_name", "_fName", "_markerName", "_mPos", "_fName", "_men", "_xName", "_base", "_found"];

{
	//collect our arguments
	_name = _x select 0;
	_fName = _x select 1;
	
	//find the building closes to this gun store owner
	_markerName = format["move_%1",_name];
	_mPos = (getMarkerPos _markerName);

	//find the owner himself
	_men = nearestObjects[_mPos, ["Man"], 300];
	{
		_xName = name _x;
		if(_xName == _fName) then
		{
			_base = (getPos _x);
			_found = nearestObjects[_base, ["Land_CashDesk_F"], 20];
			if(!isNil "_found") then {_found select 0 enableSimulation false;};
			_x enableSimulation false;
		};
	}foreach _men;
}foreach storeOwners;