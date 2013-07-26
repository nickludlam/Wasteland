
//	@file Version: 1.0
//	@file Name: getInventory.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

private["_dialog","_itemlisttext","_itemlist","_amount","_index","_listIndex","_name"];

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlisttext = _dialog displayCtrl genstore_item_TEXT;
_itemlist = _dialog displayCtrl genstore_sell_list;

//Clear the list
lbClear _itemlist;
_itemlist lbSetCurSel -1;

playerInventory = [];

_amount = 0;
_index = 0;

_amount = (player getVariable "canfood");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Canned Food"];
	_index = _index + 1;
};

_amount = (player getVariable "water");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Water"];
	_index = _index + 1;
};

_amount = (player getVariable "medkits");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Medical Kit"];
	_index = _index + 1;
};

_amount = (player getVariable "repairkits");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Repair Kit"];
	_index = _index + 1;
};

_amount = (player getVariable "fuelFull");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Jerry Can (Full)"];
	_index = _index + 1;
};

_amount = (player getVariable "fuelEmpty");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Jerry Can (Empty)"];
	_index = _index + 1;
};

_amount = (player getVariable "spawnBeacon");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Spawn Beacon"];
	_index = _index + 1;
};
_amount = (player getVariable "camonet");
for [{_x=1},{_x<=_amount},{_x=_x+1}] do
{
	playerInventory set [_index, "Camo Net"];
	_index = _index + 1;
};

{
	_name = _x;
	{
		if(_name == _x select 0) then
		{
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_x select 3];
		};
	} forEach generalStore;
} forEach playerInventory;