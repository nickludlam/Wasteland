//===========================================================================
loadFromDBClient =
{
	private["_array", "_uid", "_varName", "_varValue", "_subValue", "_subValue2", "_magazines", "_mag", "_name", "_magazines", "_in"];
	_array = _this;
	_uid = _array select 0;

	if(((getPlayerUID player) != _uid) AND ((getPlayerUID player + "_donation" != _uid))) exitWith {if(_varName == 'ComputedMoney') then {moneyLoaded = 1;};};

	_varName = _array select 1;
	_varValue = _array select 2;
	if(isNil '_varValue') exitWith 
	{
		if(_varName == 'ComputedMoney') then {moneyLoaded = 1;};
		if(_varName == 'Position') then {positionLoaded = 1;};
		if(_varName == 'Weapons') then {primaryLoaded = 1;};
		if(_varName == 'SecondaryWeapon') then {secondaryLoaded = 1;};
		if(_varName == 'Backpack') then { backpackLoaded = 1;};
		if(_varName == 'Vest') then { vestLoaded = 1;};
		if(_varName == 'Outfit') then { outfitLoaded = 1;};
	};
	
	//player globalChat format["%1", _varName];
	if(_varName == 'ComputedMoney') then {player setVariable["computedMoney",_varValue,true]; moneyLoaded = 1;};
	if(_varName == 'Health') then {player setDamage _varValue;};
	if(_varName == 'Goggles') then {player addGoggles _varValue;};
	//if(_varName == 'Money') then {player setVariable["cmoney",_varValue,true];};
	if(_varName == 'CanFood') then {player setVariable["canfood",_varValue,true];};
	if(_varName == 'Medkits') then {player setVariable["medkits",_varValue,true];};
	if(_varName == 'Water') then {player setVariable["water",_varValue,true];};
	if(_varName == 'Fuel') then {player setVariable["fuel",_varValue,true];};
	if(_varName == 'RepairKits') then {player setVariable["repairkits",_varValue,true];};
	if(_varName == 'FuelFull') then {player setVariable["fuelFull",_varValue,true];};
	if(_varName == 'FuelEmpty') then {player setVariable["fuelEmpty",_varValue,true];};
	if(_varName == 'SpawnBeacon') then {player setVariable["spawnBeacon",_varValue,true];};
	if(_varName == 'Camonet') then {player setVariable["camonet",_varValue,true];};
	//if(_varName == 'Magazines') then {{player addMagazine _x;}foreach _varValue;};
	if(_varName == 'Items') then 
	{
		for "_i" from 0 to (count _varValue) - 1 do 
		{
			_name = _varValue select _i;
			_in = isClass (configFile >> "cfgMagazines" >> _name);
			//player globalChat format["%1", _name];
			//player globalChat format["%1", _in];
			_exe = [player, (_name)] call fn_fitsInventory;
			if(_exe == 1) then
			{
				if(str(_in) == "false")then{player addItem _name;}
				else{player addMagazine _name;};
			};
			if(_exe == 2) then
			{
				if(str(_in) == "false")then{player addItem _name;}
				else{player addMagazine _name;};
			};
			if(_exe == 3) then
			{
				if(str(_in) == "false")then
				{
					_backpack = unitBackpack player;
					_backpack addItemCargo [_name,1];
				}
				else
				{	
					_backpack = unitBackpack player;
					_backpack addMagazineCargo [_name,1];
				};
			};
		};
	};
	if(_varName == 'Weapons') then 
	{
		removeAllWeapons player;
		{
			player addWeapon _x;
		}foreach _varValue;
		primaryLoaded = 1;
	};
	if(_varName == 'PrimaryItems') then 
	{
		{
			player addPrimaryWeaponItem _x;
		}foreach _varValue;
	};
	if(_varName == 'SecondaryItems') then 
	{
		{
			player addSecondaryWeaponItem _x;
		}foreach _varValue;
	};
	if(_varName == 'HandgunItems') then 
	{
		{
			player addHandgunItem _x;
		}foreach _varValue;
	};
	if(_varName == 'PrimaryMagazine') then 
	{
		for "_i" from 0 to (count _varValue) - 1 do 
		{
			_name = _varValue select _i;
			_exe = [player, (_name)] call fn_fitsInventory;			
			if(_exe == 1) then
			{
				player addMagazine _name;
			};
			if(_exe == 2) then
			{
				player addMagazine _name;
			};
			if(_exe == 3) then
			{
				_backpack = unitBackpack player;
				_backpack addMagazineCargo [_name,1];
			};
		};
	};
	if(_varName == 'SecondaryMagazine') then 
	{
		for "_i" from 0 to (count _varValue) - 1 do 
		{
			_name = _varValue select _i;
			_exe = [player, (_name)] call fn_fitsInventory;			
			if(_exe == 1) then
			{
				player addMagazine _name;
			};
			if(_exe == 2) then
			{
				player addMagazine _name;
			};
			if(_exe == 3) then
			{
				_backpack = unitBackpack player;
				_backpack addMagazineCargo [_name,1];
			};
		};
	};
	if(_varName == 'HandgunMagazine') then 
	{
		for "_i" from 0 to (count _varValue) - 1 do 
		{
			_name = _varValue select _i;
			_exe = [player, (_name)] call fn_fitsInventory;			
			if(_exe == 1) then
			{
				player addMagazine _name;
			};
			if(_exe == 2) then
			{
				player addMagazine _name;
			};
			if(_exe == 3) then
			{
				_backpack = unitBackpack player;
				_backpack addMagazineCargo [_name,1];
			};
		};
	};
	if(_varName == 'Magazines') then
	{
		{player removeMagazine _x} forEach magazines player;
		for "_i" from 0 to (count _varValue) - 1 do 
		{
			_name = _varValue select _i;
			_exe = [player, (_name)] call fn_fitsInventory;			
			//player globalChat format["%1", _exe]; 
			//player globalChat format["%1", _name]; 
			if(_exe == 1) then
			{
				//player globalChat "adding to player"; 
				player addMagazine _name;
			};
			if(_exe == 2) then
			{
				//player globalChat "adding to vest"; 
				player addMagazine _name;
			};
			if(_exe == 3) then
			{
				_backpack = unitBackpack player;
				_backpack addMagazineCargo [_name,1];
			};
		};
	};
	if(_varName == 'SecondaryWeapon') then {player addWeapon _x; secondaryLoaded = 1;};
	if(_varName == 'Outfit') then {removeUniform player; player addUniform _varValue; outfitLoaded = 1;};
	if(_varName == 'HeadGear') then {removeHeadgear player; player addHeadgear _varValue;};
	if(_varName == 'Backpack') then {removeBackpack player; player addBackpack _varValue; backpackLoaded = 1;};
	if(_varName == 'Vest') then {removeVest player; player addVest _varValue; vestLoaded = 1;};
	if(_varName == 'Position') then {player setPos _varValue; player setVariable["positionLoaded", 1,true]; positionLoaded = 1;};
	if(_varName == 'Direction') then {player setDir _varValue;};
};

//===========================================================================
_sendToServer =
"
	accountToServerLoad = _this;
	publicVariableServer 'accountToServerLoad';
";

sendToServer = compile _sendToServer;
//===========================================================================
"accountToClient" addPublicVariableEventHandler 
{
	(_this select 1) spawn loadFromDBClient;
};
//===========================================================================

statFunctionsLoaded = 1;

if(ssDebug == 1) then
{

};

