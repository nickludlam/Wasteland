/*
	

*/
private ["_name", "_men", "_foundChair", "_fName", "_markerName", "_mPos", "_objects", "_building", "_xName", "_pDir", "_base", "_bPos"];
if (!isNil "StoreOwnersInited") exitWith{}

{
	//collect our arguments
	_name = _x select 0;
	_fName = _x select 1;
	
	//find the building closes to this gun store owner
	_markerName = format["move_%1",_name];
	_mPos = (getMarkerPos _markerName);
	_objects =  nearestObjects [_mPos, ["Building"], 10];
	_building = _objects select 0;
	
	//find the owner himself
	_men = nearestObjects[_mPos, ["Man"], 300];
	{
		_xName = name _x;

		if(_xName == _fName) then
		{
			_bPos = nil;
			switch _fName do
			{
				case "West GS":{_bPos = (_building buildingPos 6);}; //Girna
				case "West GSA":{_bPos = (_building buildingPos 3);}; //Airfield south
				case "East GS":{_bPos = (_building buildingPos 6);}; //Kill Farm
				case "West VS":{_bPos = (_building buildingPos 1); }; //Airfield North
				case "North VS":{_bPos = (_building buildingPos 4); }; //below impound lot
				case "South VS":{_bPos = (_building buildingPos 1); }; //Between general store and gun runner on west side
				case "East VS":{_bPos = (_building buildingPos 0); }; //North-East below light house
				case "North Gen":{_bPos = (_building buildingPos 1);}; //kamino
				case "West Gen":{_bPos = (_building buildingPos 0); }; //Between Girna and Gun Runner
				case "East Gen":{_bPos = (_building buildingPos 6);}; //Central general store
				case "East GenS":{_bPos = (_building buildingPos 0);}; //By boat repair on the south-east
				case "East GR":{_bPos = (_building buildingPos 0);}; //Easterly GR water camp
				case "West GR":{_bPos = (_building buildingPos 0);}; //Westerly GR by godmode's garage
				case "East GSE":{_bPos = (_building buildingPos 3);}; //first gun store (OG camper's paradise)
				case "North GenS":{_bPos = (_building buildingPos 3);}; //agia marina
				default{_bPos = (_building buildingPos 0);};
			};
			_pDir = (getDir _x);
			_base = (getPos _x);
			
			//find the bench and sit his bitch ass on it
			_foundChair = nearestObjects[_base, ["Land_Bench_F"], 20];
			
			//set the store owner properties
			_x setVelocity [0,0,0];
			_x setDir 45;
			if(!isNil "_foundChair") then {_x attachTo [_foundChair select 0,[0,-.3,.25]];};
			_x switchMove "passenger_flatground_leanright";
			_x disableAI "MOVE"; _x disableAI "ANIM"; _x disableAI "TARGET";
		};
	}foreach _men;
}foreach storeOwners;

StoreOwnersInited = true;
publicVariable "StoreOwnersInited";