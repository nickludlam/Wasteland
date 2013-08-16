
//	@file Version: 1.0
//	@file Name: populateGenStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\genstoreDefines.sqf";
disableSerialization;

private["_switch","_dialog","_itemlist","_weapon","_picture","_listIndex"];

_switch = _this select 0;

if (isNil "_switch") then {
	_switch = 0;
};

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_itemlist = _dialog displayCtrl genstore_item_list;

//Clear the list

[] execVM "client\systems\generalStore\getInventory.sqf";
switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_weapon = (configFile >> "CfgWeapons" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_picture];
		} forEach headArray;
	};
	
	case 1: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_weapon = (configFile >> "CfgWeapons" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_picture];
		} forEach uniformArray;
	};
	
	case 2: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_weapon = (configFile >> "CfgWeapons" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_picture];
		} forEach vestArray;
	};
	
	case 3: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_weapon = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_gunlistIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_gunlistIndex,_picture];
		} forEach backpackArray;	
	};
	
	case 4: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_weapon = (configFile >> "CfgWeapons" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_picture];
		} forEach genItemArray;
	};
	
	case 5: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_x select 3];
		} forEach generalStore;
	};

	case 6: 
	{
		//Clear the list
		lbClear _itemlist;
		_itemlist lbSetCurSel -1;

		{
			_weapon = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_weapon >> "picture");
			_listIndex = _itemlist lbAdd format["%1",_x select 0];
			_itemlist lbSetPicture [_listIndex,_x select 3];
		} forEach genObjectsArray;
	};
};