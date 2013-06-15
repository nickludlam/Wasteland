
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
//#include "addons\proving_ground\defs.hpp"
#define GET_DISPLAY (findDisplay balca_debug_VC_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
disableSerialization;
//if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_name"];

//Initialize Values
_switch = _this select 0;

_size = 0;
_exe = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_ammoList = _dialog displayCtrl gunshop_ammo_list;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_playerMoney = player getVariable "cmoney";
_playerSlots = [];
_size = lbSize _cartlist;
_itemText = "";

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		//get the item's text
		_itemText = lbText  [gunshop_ammo_list, (lbCurSel gunshop_ammo_list)];			
		_playerSlots = [player] call BIS_fnc_invSlotsEmpty;

		{
			if(_itemText == _x select 0) then
			{
				_class = _x select 1;
				_name = _x select 1;
				_mag = (configFile >> "cfgMagazines" >> _class);
				_type = (getNumber(_mag >> "type"));
				_price = _x select 2;
				
				//ensure they player has enought money
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];breakTo "main"};
				_exe = [player, _class] call fn_fitsInventory;					
				if(_exe == 0) then
				{
					{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
					hint format["You don't have enough space for %1", _name];
				};
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
					_backpack addMagazineCargo[_name,1];
				};
			}
		}forEach ammoArray;
	};
};

player setVariable["cmoney",_playerMoney - _price,true];
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

//gunStoreCart = 0;
//_totalText CtrlsetText format["Total: $%1", gunStoreCart];
//lbClear _cartlist;
