
if(!X_Server) exitWith {};
private ["_pos", "_name", "_men", "_run", "_fPos", "_fName", "_markerName", "_mPos", "_objects", "_building", "_xName", "_bDeskDirMod", "_pDir", "_createStoreArea"];

_createStoreArea = 
{
	private ["_storeOwner", "_bPos", "_pDir", "_pDDirMod", "_fName", "_chair", "_desk", "_base", "_deskPos"];
	
	//grab our arguments
	_storeOwner = _this select 0;
	_bPos = _this select 1;
	_pDir = _this select 2;
	_pDDirMod = _this select 3;
	_fName = _this select 4;
	_base = getPos _storeOwner;
	
	//create the bench NOTE: was going to use a plastic chair, but the bench looks nicer
	_chair setVelocity [0,0,0];
	_chair = "Land_Bench_F" createVehicle _base;
	_chair setPos _bPos;
	_chair setDir _pDir + 90;
	
	//create the cashier station
	_desk setVelocity [0,0,0];
	_deskPos = [(_bPos select 0)+1.2*sin(_pDir),(_bPos select 1)+1.2*cos(_pDir),(_bPos select 2)];
	_desk = "Land_CashDesk_F" createVehicle _base;
	_desk setPos _deskPos;
	_desk setDir _pDDirMod;
	_chair disableCollisionWith _desk;
	
	//set the store owner's position
	//_storeOwner switchMove "passenger_flatground_leanright";
	_storeOwner switchMove "passenger_flatground_crosslegs";
	_storeOwner setVelocity [0,0,0];
	_storeOwner setPos [(_bPos select 0), (_bPos select 1), (_bPos select 2) + .40];
	_storeOwner setDir _pDir + 60;
	_storeOwner moveInCargo _chair;
	_storeOwner disableAI "MOVE"; _storeOwner disableAI "ANIM"; _storeOwner disableAI "TARGET";
	_storeOwner attachTo [_chair,[0,-.7,.3]];
};

{
	_name = _x select 0;
	_fPos = _x select 1;
	_fName = _x select 2;
	
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
		if(damage _building < .5) then
		{
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
				[_x, _bPos, _pDir, _bDeskDirMod, _fName] call _createStoreArea;
			};
		};
	}foreach _men;
}foreach storeOwners;