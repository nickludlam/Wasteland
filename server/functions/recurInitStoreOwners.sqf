if(!X_Server) exitWith {};
private ["_pos", "_name", "_men", "_run", "_fPos", "_fName", "_markerName", "_mPos", "_objects", "_building", "_xName"];
_run = true;
while{_run} do
{
	sleep 3600;
	//sleep 3800;
	//sleep 1;
	{
		_name = _x select 0;
		_fPos = _x select 1;
		_fName = _x select 2;
		_markerName = format["move_%1",_name];
		_mPos = (getMarkerPos _markerName);
		_objects =  nearestObjects [_mPos, ["Building"], 10];
		if(count _objects > 0) then
		{
			_building = _objects select 0;
			_men = nearestObjects[_mPos, ["Man"], 300];
			{
				_xName = name _x;
				if((!isnil "_building")&&(damage _building < .5)) then
				{
					if(_xName == _fName) then
					{
						switch _fName do
						{
							case "West GS":{_x setPos (_building buildingPos 6);};//2 or 5 or 4 or 6
							case "West GSA":{_x setPos (_building buildingPos 3);};//3
							case "West VS":{_x setPos (_building buildingPos 1);};
							case "North VS":{_x setPos (_building buildingPos 4);};
							case "South VS":{_x setPos (_building buildingPos 1);};
							case "East GS":{_x setPos (_building buildingPos 6);};
							case "West Gen":{_x setPos (_building buildingPos 0);};
							case "East Gen":{_x setPos (_building buildingPos 6);};
							case "East GenS":{_x setPos (_building buildingPos 0);};
							case "East GR":{_x setPos (_building buildingPos 0);};
							case "East GSE":{_x setPos (_building buildingPos 3);};
							case "North GenS":{_x setPos (_building buildingPos 3);};
							default{_x setPos (_building buildingPos 0);};
						};
					};
				};
			}foreach _men;
		};
	}foreach storeOwners;
};