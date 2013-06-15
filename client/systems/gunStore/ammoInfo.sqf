
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";

disableSerialization;

//Initialize Values
_weap_type = "";
_picture = "";
_price = 0;

// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_ammolist = _dialog displayCtrl gunshop_ammo_list;
_ammoText = _dialog displayCtrl gunshop_ammo_TEXT;

//Get Selected Item
_selectedItem = lbCurSel _ammolist;
_itemText = _ammolist lbText _selectedItem;

_ammoText ctrlSetText format [""];
{if(_itemText == _x select 0) then
{
	_weap_type = _x select 1; 
	_price = _x select 2;
	_ammoText ctrlSetText format ["Price: $%1", _price];	
}}forEach ammoArray;
