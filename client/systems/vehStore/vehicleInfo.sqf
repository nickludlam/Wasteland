
//	@file Version: 1.0
//	@file Name: weaponInfo.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\vehstoreDefines.sqf";

disableSerialization;
private ["_veh_type","_price","_dialog","_vehlist","_vehText","_picture","_colorlist","_selectedItem","_itemText","_weap_type","_NoColorVehs","_RGBVehicles","_isRGB","_isDumb","_colorlistIndex"];
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

_NoColorVehs = ["Offroad","HEMTT Open","HEMTT Covered","Ifrit","Ifrit HMG","Ifrit GMG","Strider","Strider HMG","Strider GMG","MSE-3 Marid","AH-99 Blackfoot","Assault Boat Blue","SDV Submarine Blue","IFV-6c Panther","BTR-K Kamysh"];
_RGBVehicles = ["Quadbike Blue","Quadbike Red","Quadbike Green","Quadbike Civilian","Zamak Open","Zamak Covered","Assault Boat Red","Assault Boat Green","Rescue Blue","Rescue Red","Rescue Civilian","UH-80 Ghosthawk","SDV Submarine Green","SDV Submarine Red"];

{
	if(_itemText in _NoColorVehs) exitWith{};
	
	_isRGB = _x select 1;
	_isDumb = false;
	if(_itemText in _RGBVehicles) then {_isDumb = true;};
	
	if(_itemText != "") then
	{
		if((str(_isDumb) == "true") AND (str(_isRGB) == "false")) then { _isDumb = true;}
		else {_colorlistIndex = _colorlist lbAdd format["%1",_x select 0];};
	};
}foreach colorsArray;
