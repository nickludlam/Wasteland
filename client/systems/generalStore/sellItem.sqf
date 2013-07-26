
//	@file Version: 1.0
//	@file Name: sellItems.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "defines.hpp"
#include "dialog\genstoreDefines.sqf";
disableSerialization;
private["_playerMoney","_size","_dialog","_itemlist","_totalText","_playerMoneyText","_itemText","_price"];
//Initialize Values
_playerMoney = player getVariable __MONEY_VAR_NAME__;
_size = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlist = _dialog displayCtrl genstore_sell_list;
_totalText = _dialog displayCtrl genstore_total;
_playerMoneyText = _Dialog displayCtrl genstore_money;

_itemText = lbText  [genstore_sell_list, (lbCurSel genstore_sell_list)];
_price = 0;
{
	if(_itemText == _x select 0) then
	{
		_price = _x select 5;
	};
} forEach generalStore;


if(_itemText == "Water") then {player setVariable["water",(player getVariable "water") - 1,false];};
if(_itemText == "Canned Food") then {player setVariable["canfood",(player getVariable "canfood") - 1,false];};
if(_itemText == "Medical Kit") then {player setVariable["medkits",(player getVariable "medkits") - 1,false];};
if(_itemText == "Repair Kit") then {player setVariable["repairkits",(player getVariable "repairkits") - 1,false];};
if(_itemText == "Jerry Can (Full)") then {player setVariable["fuelFull",(player getVariable "fuelFull") - 1,false];};
if(_itemText == "Jerry Can (Empty)") then {player setVariable["fuelEmpty",(player getVariable "fuelEmpty") - 1,false];};
if(_itemText == "Spawn Beacon") then {player setVariable["spawnBeacon",(player getVariable "spawnBeacon") - 1,false];};
if(_itemText == "Camo Net") then {player setVariable["camonet",(player getVariable "camonet") - 1,false];};

player setVariable[__MONEY_VAR_NAME__,_playerMoney + _price,true];
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable __MONEY_VAR_NAME__];
[] execVM "client\systems\generalStore\getInventory.sqf";