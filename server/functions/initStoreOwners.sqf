
if(!X_Server) exitWith {};
private ["_pos", "_name", "_men", "_run", "_fName", "_markerName", "_mPos", "_objects", "_building", "_xName", "_bDeskDirMod", "_pDir", "_createStoreArea","_chair"];

{
	//collect our arguments
	_name = _x select 0;
	_fName = _x select 1;
	
	//find the building closes to this gun store owner
	_markerName = format["move_%1",_name];
	_mPos = (getMarkerPos _markerName);
	_objects =  nearestObjects [_mPos, ["Building"], 10];
	_building = _objects select 0;
	
	//if we grabbed more than just the owning building then make damn sure they don't take damage
	{
		_x removeAllEventHandlers "hit";
		_x removeAllEventHandlers "dammaged";
		_x removeAllEventHandlers "handleDamage";
		_x addeventhandler ["hit", {(_this select 0) setdamage 0;}];
		_x addeventhandler ["dammaged", {(_this select 0) setdamage 0;}];
		_x addEventHandler["handledamage", {false}];
		_x allowDamage false;
	}foreach _objects;

	//find the owner himself
	_men = nearestObjects[_mPos, ["Man"], 300];
	{
		_xName = name _x;
		if(_xName == _fName) then
		{
			_bPos = nil;
			_bDeskDirMod = nil;
			switch _fName do
			{
				case "West GS":{_bPos = (_building buildingPos 6); _bDeskDirMod = 110;}; //Girna
				case "West GSA":{_bPos = (_building buildingPos 3); _bDeskDirMod = 5;}; //Airfield south
				case "East GS":{_bPos = (_building buildingPos 6);  _bDeskDirMod = -120;}; //Kill Farm
				case "West VS":{_bPos = (_building buildingPos 1); _bDeskDirMod = 220;}; //Airfield North
				case "North VS":{_bPos = (_building buildingPos 4); _bDeskDirMod = 20;}; //below impound lot
				case "South VS":{_bPos = (_building buildingPos 1); _bDeskDirMod = 150;}; //Between general store and gun runner on west side
				case "East VS":{_bPos = (_building buildingPos 0); _bDeskDirMod = 0;}; //North-East below light house
				case "North Gen":{_bPos = (_building buildingPos 1); _bDeskDirMod = -40;}; //kamino
				case "West Gen":{_bPos = (_building buildingPos 0); _bDeskDirMod = 50;}; //Between Girna and Gun Runner
				case "East Gen":{_bPos = (_building buildingPos 6); _bDeskDirMod = -160;}; //Central general store
				case "East GenS":{_bPos = (_building buildingPos 0); _bDeskDirMod = 40;}; //By boat repair on the south-east
				case "East GR":{_bPos = (_building buildingPos 0); _bDeskDirMod = -65;}; //Easterly GR water camp
				case "West GR":{_bPos = (_building buildingPos 0); _bDeskDirMod = 50;}; //Westerly GR by godmode's garage
				case "East GSE":{_bPos = (_building buildingPos 3); _bDeskDirMod = 120;}; //first gun store (OG camper's paradise)
				case "North GenS":{_bPos = (_building buildingPos 3); _bDeskDirMod = 90;}; //agia marina
				default{_bPos = (_building buildingPos 0);};
			};
			_pDir = (getDir _x);
			/*_chair =*/ [_x, _bPos, _pDir, _bDeskDirMod, _fName] call createStoreArea;
			_x setPos [(_bPos select 0), (_bPos select 1), (_bPos select 2)];
			
			_x setVelocity [0,0,0];
			_x disableAI "MOVE"; _x disableAI "ANIM"; _x disableAI "TARGET";
			//_x setDir 45;
			//if(!isNil "_foundChair") then {_x attachTo [_foundChair select 0,[0,-.3,0]];};
			//_x attachTo [_chair select 0,[0,-.3,.25]];};
			//_x switchMove "passenger_flatground_leanright";
		};
	}foreach _men;
}foreach storeOwners;