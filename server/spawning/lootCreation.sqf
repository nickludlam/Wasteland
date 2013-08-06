    //Random weapons and items spawning script for wasteland missions.
    //Author : Ed!, [GoT] JoSchaap, [KoS]His_Shadow

_odd1 = 49;       //The odds that a building is selected to place loot.
_odd2 = 25;       //The odds that the selected building's spots will have loot(almost like odds per room).
_itemtoweaponratio = 5;    //The % chances of food spawning instead of a weapon.
randomweapontestint = 0.01;   //Sets the intervals in which weaponpositions are tested. (Lower = slower, but more accurate. Higher = faster, but less accurate.)

randomWeapon_WeaponArray = 
[
	["arifle_MX_F","30Rnd_65x39_caseless_mag"],
	["arifle_TRG21_F","30Rnd_556x45_Stanag"],
	["arifle_TRG20_F","30RND_556x45_Stanag"],
	["arifle_MXC_F","30Rnd_65x39_caseless_mag_Tracer"],
	["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
	["arifle_Katiba_C_F","30Rnd_65x39_caseless_green_mag_Tracer"],
	["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
	["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green_mag_Tracer"],
	["SMG_01_F", "30Rnd_45ACP_MAG_SMG_01"],
	["SMG_02_F", "30Rnd_9x21_Mag"]
];


//NOTE: If you update the above array update this one as well!!!
randomWeapon_WeaponList =
[
	"arifle_MX_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_MXC_F",
	"arifle_Katiba_F",
	"arifle_Katiba_C_F",
	"arifle_MX_GL_F",
	"arifle_Katiba_GL_F",
	"SMG_01_F",
	"SMG_02_F"
];
 
randomOtherObjectsArray = 
[
	"Land_CanisterPlastic_F",		//Water
	"Land_Basket_F"             	// Single food unit
	//"Land_Sacks_goods_F"			//Food
];

randomweaponspawnweapon = 
{
	_position = _this;
	_objects =  nearestObjects [_position, randomWeapon_WeaponList, 50];
	{
		diag_log format["Deleting %1", _x];
		deleteVehicle _x;
	}foreach _objects;
	
	_selectedgroup = (floor(random(count randomWeapon_WeaponArray)));
	_weapon = randomWeapon_WeaponArray select _selectedgroup select 0;
	_weaponholder = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
	_weaponholder addWeaponCargoGlobal [_weapon, 1];
	if((count((randomWeapon_WeaponArray) select _selectedgroup)) > 1) then 
	{
		for[{_rm = 0}, {_rm < (2 + floor(random(3)))}, {_rm = _rm + 1}] do 
		{
			_mag = randomWeapon_WeaponArray select _selectedgroup select ((floor(random((count(randomWeapon_WeaponArray select _selectedgroup) - 1)))) + 1);
			_weaponholder addMagazineCargoGlobal [_mag, 1]; 
		};
	};
	_weaponholder setPos _position;
};

randomSpawnOther = 
{
	_position = _this;
	_objects =  nearestObjects [_position, randomOtherObjectsArray, 50];
	if(count _objects <= 2) then
	{
		_selectedindex = (floor(random(count randomOtherObjectsArray)));
		_class = randomOtherObjectsArray select _selectedindex;
		_item = createVehicle [_class, _position, [], 0, "CAN_COLLIDE"];
		_item setVariable["R3F_LOG_disabled",false];
		
		switch (_class) do
		{
			case "Land_CanisterPlastic_F": 
			{
				_item setVariable["water",20,true];
			};
			case "Land_Sacks_goods_F": 
			{
				_item setVariable["food",20,true];
			};
		};
		
		diag_log format ["randomSpawnOther: %1", _item];
		_item setPos _position;
	}
	else
	{
		diag_log "******skipped object spawning******";
	};
};


_pos = [0,0];
randomweapon_buildings = nearestObjects [_pos, ["house"], 60000];
_do = 1;
while{_do == 1} do
{ 
	sleep 30;
	{
		_building = _x;
		_buildingpos = [];
		_endloop = false;
		_poscount = 0;
		
		//get the number of available positions within this building
		while {!_endloop} do 
		{
			if(((_building buildingPos _poscount) select 0) != 0 && ((_building buildingPos _poscount) select 1) != 0) then 
			{
			_buildingpos = _buildingpos + [_building buildingPos _poscount];
			_poscount = _poscount + 1;
			} 
			else 
			{
			_endloop = true;
			};
		};
		
		//spawn the object
		_num = (random 100);
		if (_num < _odd1) then 
		{
			if (count _buildingpos > 0) then
			{  
				for[{_r = 0}, {_r < count _buildingpos}, {_r = _r + 1}] do
				{
					_num2 = (random 100);
					if (_num2 < _odd2) then
					{
						_pos = _buildingpos select _r;
						_posnew = _pos;
						if(_pos select 2 < 0) then
						{
							_pos = [_pos select 0, _pos select 1, 1];
						};					
						
						_z = 0;
						_testpos = true;
						while {_testpos} do 
						{
							if((!lineIntersects[ATLtoASL(_pos), ATLtoASL([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (!terrainIntersect[(_pos), ([_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)])]) && (_pos select 2 > 0)) then 
							{
								_posnew = [_pos select 0, _pos select 1, (_pos select 2) - (randomweapontestint * _z)];
								_z = _z + 1;
							} 
							else 
							{
								_testpos = false;
							};
						};					
						
						_posnew = [_posnew select 0,_posnew select 1,(_posnew select 2) + 0.05];
						_woi = floor(random(100));
						if(_woi < _itemtoweaponratio) then 
						{
							_posnew call randomSpawnOther;
						} 
						else 
						{
							_posnew call randomweaponspawnweapon;
						};
					};
				};
			};    
		};
	}foreach randomweapon_buildings;
	sleep 7200;
};
