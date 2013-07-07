
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\genstoreDefines.sqf";
disableSerialization;

if(genStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

//Initialize Values
_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlist = _dialog displayCtrl genstore_item_list;
_totalText = _dialog displayCtrl genstore_total;
_playerMoneyText = _Dialog displayCtrl genstore_money;
_handleMoney = 1;
_itemText = lbText  [genstore_item_list, (lbCurSel genstore_item_list)];

{
	if(_itemText == _x select 0) then
    {
		_class = _x select 1;
		_price = _x select 2;
		
		//ensure they player has enought money
		if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
		_vestName = headgear player;
		removeHeadgear player;
		player addHeadgear _class;
    };
}forEach headArray;

{
	if(_itemText == _x select 0) then
    {
        _class = _x select 1;
		_price = _x select 2;
				
		//ensure they player has enought money
		if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
        _vestName = uniform player;
		removeUniform player;
        player addUniform _class;
	};
}forEach uniformArray;

{
	if(_itemText == _x select 0) then
     {
		_class = _x select 1;
		_price = _x select 2;
		
		//ensure they player has enought money
		if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
		_vestName = vest player;

		removeVest player;
		player addVest _class;
	};
}forEach vestArray;

{
    if(_itemText == _x select 0) then
    {
        _class = _x select 1;
		_price = _x select 2;
		
		//ensure they player has enought money
			if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
		
					_backpackName = backpack player;

					removeBackpack player;
					player addBackpack _class;
	};
}forEach backpackArray;

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
}forEach genItemArray;

{
	if(_itemText == _x select 0) then
	{
		_price = _x select 4;
		if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
		switch (_itemText) do 
		{
			
			case "Water": {
				if((player getVariable "water") + 1 <= 4) then {
					player setVariable["water",(player getVariable "water") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main"
				};
			};
			
			case "Canned Food":	{
				if((player getVariable "canfood") + 1 <= 4) then {
					player setVariable["canfood",(player getVariable "canfood") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main"
				};
			};
			
			case "Medical Kit": {
				if((player getVariable "medkits") + 1 <= 2) then {
					player setVariable["medkits",(player getVariable "medkits") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main"
				};
			};
			
			case "Repair Kit": {
				if((player getVariable "repairkits") + 1 <= 2) then {
					player setVariable["repairkits",(player getVariable "repairkits") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main"  
				};
			};
			
			case "Jerry Can (Full)": {
				if(((player getVariable "fuelFull") + 1 <= 1) AND ((player getVariable "fuelEmpty") + 1 <= 1)) then {
					diag_log "full < 1 and empty < 1";
					player setVariable["fuelFull",(player getVariable "fuelFull") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					if (!((player getVariable "fuelFull") + 1 <= 1)) then {
						hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main" 
					} else {
						player setVariable["fuelEmpty",0,true];
						player setVariable["fuelFull",1,true];
					};
				};
			};
			
			case "Jerry Can (Empty)": {
				if(((player getVariable "fuelFull") + 1 <= 1) AND ((player getVariable "fuelEmpty") + 1 <= 1)) then {
					player setVariable["fuelEmpty",(player getVariable "fuelEmpty") + 1,true];
					[] execVM "client\systems\generalStore\getInventory.sqf";
				} else {
					if (((player getVariable "fuelFull") + 1 <= 1)) then {
						hint format["You are fully stocked of: %1", _itemText];_handleMoney = 0;breakTo "main"
					} else {
						player setVariable["fuelEmpty",1,true];
						player setVariable["fuelFull",0,true];
					};
				};
			};
			case "Spawn Beacon": {
				if(((player getVariable "spawnBeacon") + 1 <= 1) AND ((player getVariable "spawnBeacon") + 1 <= 1)) then {
					player setVariable["spawnBeacon",(player getVariable "spawnBeacon") + 1,true];
				} else {
					_price = 0;
					{if(_x select 0 == "Spawn Beacon") then{_price = _x select 4;};}forEach generalStore;
					genStoreCart = genStoreCart - _price;    
				};
			};
			case "Camo Net": {
				if(((player getVariable "camonet") + 1 <= 1) AND ((player getVariable "camonet") + 1 <= 1)) then {
					player setVariable["camonet",(player getVariable "camonet") + 1,true];
				} else {
					_price = 0;
					{if(_x select 0 == "Camo Net") then{_price = _x select 4;};}forEach generalStore;
					genStoreCart = genStoreCart - _price;    
				};
			};
		};
	};
}forEach generalStore;

if(_handleMoney == 1) then
{
	player setVariable["cmoney",_playerMoney - _price,true];
	_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
}