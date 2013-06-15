
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\vehstoreDefines.sqf";

disableSerialization;

//Initialize Values
_veh_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay vehshop_DIALOG;
_vehlist = _dialog displayCtrl vehshop_veh_list;
_vehText = _dialog displayCtrl vehshop_veh_TEXT;
_colorlist = _dialog displayCtrl vehshop_color_list;
lbClear _colorlist;
_colorlist lbSetCurSel -1;

//Get Selected Item
_selectedItem = lbCurSel _vehlist;
_itemText = _vehlist lbText _selectedItem;

_vehText ctrlSetText "";
{	
	if(_itemText == _x select 0) then
	{
		_weap_type = _x select 1; 
		_price = _x select 2;
		_vehText ctrlSetText format ["Price: $%1", _price];	
	}
}forEach landArray;

{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach armoredArray;
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach tanksArray;
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach helicoptersArray;
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach jetsArray;
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach boatsArray;
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_vehText ctrlSetText format ["Price: $%1", _price];	
}}forEach submarinesArray;

{
	_shouldShow = _x select 1;
	_isDumb = false;
	switch(_itemText) do
	{
		case "Quadbike":
		{
			_isDumb = true;
		};
		case "Offroad":
		{
			_isDumb = true;
		};
		case "Ifrit":
		{
			_isDumb = true;
		};
		case "Ifrit HMG":
		{
			_isDumb = true;
		};
		case "Ifrit GMG":
		{
			_isDumb = true;
		};
		case "Assault Boat Blue":
		{
			_isDumb = true;
		};
		case "Assault Boat Red":
		{
			_isDumb = true;
		};
		case "Rescue Blue":
		{
			_isDumb = true;
		};
		case "Rescue Red":
		{
			_isDumb = true;
		};
	};
	if(_itemText != "") then
	{
		if((str(_isDumb) == "true") AND (str(_shouldShow) == "false")) then { _isDumb = true;}
		else {_colorlistIndex = _colorlist lbAdd format["%1",_x select 0];};
	};
}foreach colorsArray;
