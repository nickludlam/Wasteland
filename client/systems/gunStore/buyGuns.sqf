
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "defines.hpp"
#include "dialog\gunstoreDefines.sqf";
//#include "addons\proving_ground\defs.hpp"
#define GET_DISPLAY (findDisplay balca_debug_VC_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
disableSerialization;

private ["_name"];

//Initialize Values
_switch = _this select 0;

_size = 0;
_exe = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_gunsList = _dialog displayCtrl gunshop_gun_list;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_playerMoney = player getVariable __MONEY_VAR_NAME__;
_playerSlots = [];
_size = lbSize _cartlist;
_itemText = "";
_handleMoney = 1;

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		//get the item's text
		_itemText = lbText  [gunshop_gun_list, (lbCurSel gunshop_gun_list)];			
		_playerSlots = [player] call BIS_fnc_invSlotsEmpty;
		
		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_weapon = (configFile >> "cfgWeapons" >> _class);
				_type = getNumber(_weapon >> "type");
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				
				//Main Rifle
				if(_type == 1) then
				{
					player addWeapon _class;
				};
				
				//Side Arm
				if(_type == 2) then
				{
					player addWeapon _class;
				};
				
				//Rocket Launcher
				if(_type == 4) then
				{
					player addWeapon _class;
				};
				
				//LMG
				if(_type == 5) then
				{
					player addWeapon _class;
				};
			};                    		
		}forEach pistolArray;
			
	
		{	if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_weapon = (configFile >> "cfgWeapons" >> _class);
				_type = getNumber(_weapon >> "type");				
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				
				//Main Rifle
				if(_type == 1) then
				{
					player addWeapon _class;
				};
				
				//Side Arm
				if(_type == 2) then
				{
					player addWeapon _class;
				};
				
				//Rocket Launcher
				if(_type == 4) then
				{
					player addWeapon _class;
				};
				
				//LMG
				if(_type == 5) then
				{
					player addWeapon _class;
				};
			};                    		
		}forEach rifleArray;
			
		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_weapon = (configFile >> "cfgWeapons" >> _class);
				_type = getNumber(_weapon >> "type");
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				
				//Main Rifle
				if(_type == 1) then
				{
					player addWeapon _class;
				};
				
				//Side Arm
				if(_type == 2) then
				{
					player addWeapon _class;
				};
				
				//Rocket Launcher
				if(_type == 4) then
				{
					player addWeapon _class;
				};
				
				//LMG
				if(_type == 5) then
				{
					player addWeapon _class;
				};
			};                    		
		}forEach smgArray;
			
		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_weapon = (configFile >> "cfgWeapons" >> _class);
				_type = getNumber(_weapon >> "type");
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				
				//Main Rifle
				if(_type == 1) then
				{
					player addWeapon _class;
				};
				
				//Side Arm
				if(_type == 2) then
				{
					player addWeapon _class;
				};
				
				//Rocket Launcher
				if(_type == 4) then
				{
					player addWeapon _class;
				};
				
				//LMG
				if(_type == 5) then
				{
					player addWeapon _class;
				};
			};                    		
		}forEach shotgunArray;
			
		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_weapon = (configFile >> "cfgWeapons" >> _class);
				_type = getNumber(_weapon >> "type");
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				
					player addWeapon _class;
			};                    		
		}forEach launcherArray;
			

		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_name = _x select 1;
				_price = _x select 2;
				
				//ensure they player has enought money
				if (_price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_exe = [player, _class] call fn_fitsInventory;					
				_IsMagazine = isClass (configFile >> "cfgMagazines" >> _name);
				if(_exe == 0) then
				{
					{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach throwputArray;
					hint format["You don't have enough space for %1", _name];
				};
				if(_exe == 1) then
				{
					_class = _x select 1;
					if(str(_IsMagazine) == "false")then{player addItem _class;}
					else{ player addMagazine _class;};
				};
				if(_exe == 2) then
				{
					_class = _x select 1;
					if(str(_IsMagazine) == "false")then{player addItem _class;}
					else{player addMagazine _class;};
				};
				if(_exe == 3) then
				{
					_class = _x select 1;
					if(str(_IsMagazine) == "false")then
					{
						_backpack = unitBackpack player;
						_backpack addItemCargo [_class,1];
					}
					else
					{	
						_backpack = unitBackpack player;
						_backpack addMagazineCargo [_class,1];
					};
				};
			}
		}forEach throwputArray;

		{
            if(_itemText == _x select 0) then
            {
                _class = _x select 1;
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				switch((_x select 3)) do
                {
                	case "binoc":
                    {
                        if((_playerSlots select 5) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach accessoriesArray;
							hint format["You do not have space for this item %1",_name];
							_handleMoney = 0;
							breakTo "main"
						};
                    };
                    case "item":
                    {
						_exe = [player, _class] call fn_fitsInventory;
						_class = _x select 1;
						if(_exe == 0) then
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach accessoriesArray;
							hint format["You don't have enough space for %1", _name];
							_handleMoney = 0;
							breakTo "main"
						};
						if(_exe == 1) then
						{
							player addItem _class;
						};
						if(_exe == 2) then
						{
							player addItem _class;
						};
						if(_exe == 3) then
						{
							_backpack = unitBackpack player;
							_backpack addItemCargo[_class,1];
						};
                        //player addItem _class;
                    };
                    case "vest":
                    {
                        _vestName = vest player;

						removeVest player;
                        player addVest _class;
                    };
					case "backpack":
					{
						_backpackName = backpack player;

						removeBackpack player;
						player addBackpack _class;
					};
                    case "uni":
                    {
                        _vestName = uniform player;
						removeUniform player;
                        player addUniform _class;
                    };
                    case "hat":
                    {
                        _vestName = headgear player;
						removeHeadgear player;
                        player addHeadgear _class;
                    };
                    case "gogg":
                    {
                        _vestName = goggles player;
                        removeGoggles player;
                        player addgoggles _class;
                    };
					case "ammocrate":
					{
						[currentOwnerID, currentOwnerName, PURCHASED_CRATE_TYPE_AMMO] execVM "client\functions\placePurchasedCrate.sqf";
						//_playerPos = getPos player;
						//_ammoTypes = ["Box_NATO_Ammo_F","Box_NATO_Grenades_F","Box_NATO_AmmoOrd_F","Box_IND_Ammo_F","Box_IND_Grenades_F","Box_IND_AmmoOrd_F","Box_EAST_Ammo_F","Box_EAST_Grenades_F","Box_EAST_AmmoOrd_F"];
						//_sbox = createVehicle [_ammoTypes call BIS_fnc_selectRandom,[(_playerPos select 0), (_playerPos select 1),0],[], 0, "NONE"];
						//clearMagazineCargoGlobal _sbox;
						//clearWeaponCargoGlobal _sbox;
						//clearItemCargoGlobal _sbox;
					};
					case "weaponcrate":
					{
					//PURCHASED_CRATE_TYPE_WEAPON
					[currentOwnerID, currentOwnerName, PURCHASED_CRATE_TYPE_WEAPON] execVM "client\functions\placePurchasedCrate.sqf";
						//_playerPos = getPos player;
						//_weaponTypes = ["Box_NATO_Wps_F","Box_NATO_WpsLaunch_F","Box_NATO_WpsSpecial_F","B_supplyCrate_F","Box_NATO_Support_F","Box_IND_Wps_F","Box_IND_WpsLaunch_F","Box_IND_WpsSpecial_F","I_supplyCrate_F","Box_IND_Support_F", "Box_EAST_Wps_F","Box_EAST_WpsLaunch_F","Box_EAST_WpsSpecial_F","O_supplyCrate_F","Box_EAST_Support_F"];
						//_sbox = createVehicle [_weaponTypes call BIS_fnc_selectRandom,[(_playerPos select 0), (_playerPos select 1),0],[], 0, "NONE"];
						//clearMagazineCargoGlobal _sbox;
						//clearWeaponCargoGlobal _sbox;
						//clearItemCargoGlobal _sbox;
					};
                    case default
                    {
                        
                    };
                };
			};
        }forEach accessoriesArray;
			
			
		{
            if(_itemText == _x select 0) then
            {
                _class = _x select 1;
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				switch((_x select 3)) do
                {
                	case "binoc":
                    {
                        if((_playerSlots select 5) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach apparelArray;
							hint format["You do not have space for this item %1",_name];
							_handleMoney = 0;
							breakTo "main"
						};
                    };
                    case "item":
                    {
                        player addItem _class;
                    };
                    case "vest":
                    {
                        _vestName = vest player;

						removeVest player;
                        player addVest _class;
                    };
					case "backpack":
					{
						_backpackName = backpack player;
			
						removeBackpack player;
						player addBackpack _class;
					};
                    case "uni":
                    {
                        _vestName = uniform player;
						removeUniform player;
                        player addUniform _class;
                    };
                    case "hat":
                    {
                        _vestName = headgear player;
						removeHeadgear player;
                        player addHeadgear _class;
                    };
					case "gogg":
                    {
                        _vestName = goggles player;
                        removeGoggles player;
                        player addgoggles _class;
                    };
                    case default
                    {
                        
                    };
                };
			};
        }forEach apparelArray;
			
		{
            if(_itemText == _x select 0) then
            {
                _class = _x select 1;
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				switch((_x select 3)) do
                {
                	case "binoc":
                    {
                        if((_playerSlots select 5) >= 1) then
						{
							player addWeapon _class;
						}
						else
						{
							{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach backpackArray;
							hint format["You do not have space for this item %1",_name];
							_handleMoney = 0;
							breakTo "main"
						};
                    };
                    case "item":
                    {
                        player addItem _class;
                    };
                    case "vest":
                    {
                        _vestName = vest player;

						removeVest player;
                        player addVest _class;
                    };
					case "backpack":
					{
						_backpackName = backpack player;

						removeBackpack player;
						player addBackpack _class;
					};
                    case "uni":
                    {
                        _vestName = uniform player;
						removeUniform player;
                        player addUniform _class;
                    };
                    case "hat":
                    {
                        _vestName = headgear player;
						removeHeadgear player;
                        player addHeadgear _class;
                    };
                    case default
                    {
                        
                    };
                };
			};
        }forEach backpackArray;
	};
};
if(_handleMoney == 1) then
{
	player setVariable[__MONEY_VAR_NAME__,_playerMoney - _price,true];
	_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable __MONEY_VAR_NAME__];
}

