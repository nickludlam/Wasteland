
//	@file Version: 1.0
//	@file Name: populateGunStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = populate list with guns 1 = populate list with ammo 2 = populate list with equipment)]

#include "dialog\vehstoreDefines.sqf";
disableSerialization;
private ["_switch","_dialog","_vehlisttext","_vehlist","_colorlist","_vehicles","_picture","_vehlistIndex"];
_switch = _this select 0;

// Grab access to the controls
_dialog = findDisplay vehshop_DIALOG;
_vehlisttext = _dialog displayCtrl vehshop_veh_TEXT;
_vehlist = _dialog displayCtrl vehshop_veh_list;
_colorlist = _dialog displayCtrl vehshop_color_list;

switch(_switch) do 
{
	case 0: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach landArray;
	};
	
	case 1: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach armoredArray;
	};
	
	case 2: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach tanksArray;
	};
	
	case 3: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach helicoptersArray;
	};
	
	case 4: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach jetsArray;
	};
	
	case 5: 
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach boatsArray;
	};

	case 6:
	{
		//Clear the list
		lbClear _vehlist;
		lbClear _colorlist;
		_vehlist lbSetCurSel -1;

		// Populate the gun shop weapon list
		{
			_vehicles = (configFile >> "CfgVehicles" >> _x select 1);
			_picture = getText (_vehicles >> "picture");
			_vehlistIndex = _vehlist lbAdd format["%1",_x select 0];
			_vehlist lbSetPicture [_vehlistIndex,_picture];
		} forEach submarinesArray;	
	};
};