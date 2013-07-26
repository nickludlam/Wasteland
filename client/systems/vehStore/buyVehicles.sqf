
//	@file Version: 1.0
//	@file Name: buyVehicles.sqf
//	@file Author: His_Shadow
//	@file Created: 06/14/2013 05:13

#include "defines.hpp"
#include "dialog\vehstoreDefines.sqf";

private ["_switch","_playerMoney","_price","_dialog","_playerMoneyText","_colorText","_itemText","_handleMoney","_applyVehProperties","_car","_veh_type","_vehPos","_DoSpawn","_old_veh","_class", "_idc","_types","_res","_selection","_veh","_dir"];

//#include "addons\proving_ground\defs.hpp"
//#define GET_DISPLAY (findDisplay balca_debug_VC_IDD)
//#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
//#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
//#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
disableSerialization;

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable __MONEY_VAR_NAME__;
_price = 0;

// Grab access to the controls
_dialog = findDisplay vehshop_DIALOG;
_playerMoneyText = _Dialog displayCtrl vehshop_money;
_colorText = lbText [vehshop_color_list, (lbCurSel vehshop_color_list)];
_itemText = lbText  [vehshop_veh_list, (lbCurSel vehshop_veh_list)];
_handleMoney = 1;

_applyVehProperties = 
{
    private ["_car","_colorText","_texturePath", "_veh_type", "_vehPos"];
	_car = _this select 0;
	_colorText = _this select 1;
	_veh_type = _this select 2;
	_vehPos = _this select 3;
	
	_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
	//_veh setDir _dir;
	_car setVariable ["newVehicle",1,true];
	_car setVelocity [0,0,0];
	
	//if they chose a color set the color
	if(_colorText == "Orange") then { _texturePath = '#(argb,8,8,3)color(0.82,0.2,0,1)';};
	if(_colorText == "Red") then { _texturePath = '#(argb,8,8,3)color(0.79,0.03,0,1)';};
	if(_colorText == "Pink") then { _texturePath = '#(argb,8,8,3)color(0.91,0.53,0.57,1)';};
	if(_colorText == "Yellow") then { _texturePath = '#(argb,8,8,3)color(1,0.97,0.17,1)';};
	if(_colorText == "Purple") then { _texturePath = '#(argb,8,8,3)color(0.43,0.18,0.67,1)';};
	if(_colorText == "Blue") then { _texturePath = '#(argb,8,8,3)color(0,0.1,0.8,1)';};
	if(_colorText == "Dark Blue") then { _texturePath = '#(argb,8,8,3)color(0.03,0.02,0.35,1)';};
	if(_colorText == "Green") then { _texturePath = '#(argb,8,8,3)color(0.01,0.64,0,1)';};
	if(_colorText == "Black") then { _texturePath = '#(argb,8,8,3)color(0,0,0,1)';};
	if(_colorText == "White") then { _texturePath = '#(argb,8,8,3)color(1,1,1,1)';};
	if(_colorText == "Teal") then { _texturePath = '#(argb,8,8,3)color(0,0.93,0.86,1)';};
	if(_colorText == "Orange Camo") then {_texturePath ="images\camo_fack.jpg";};
	if(_colorText == "Red Camo") then {_texturePath = "images\camo_deser.jpg";};
	if(_colorText == "Yellow Camo") then {_texturePath = "images\camo_fuel.jpg";};
	if(_colorText == "Pink Camo") then {_texturePath = "images\camo_pank.jpg";};
	_car setVariable ["textureName", _texturePath];
	
	if(_texturePath != "") then
	{
		if(!isDedicated) then {call serverRelayHandler};
		serverRelaySystem = [MESSAGE_VEHICLE_PROPERTIES_APPLY, _car, _texturePath];
		publicVariable "serverRelaySystem";
	};

	//tell the vehicle to delete itself after dying
	_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
	
	//enable vehicle locking
	_car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
};

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["land_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach landArray;
		
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["land_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach armoredArray;
		
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["land_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach tanksArray;
		
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["air_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach helicoptersArray;
		
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["air_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach jetsArray;
				
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};				
				_class = _x select 1;
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;			
				_vehPos =(getMarkerPos format ["sea_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach boatsArray;
		
		{
			if(_itemText == _x select 0) then
			{
				_price = _x select 2;
				if ( _price > parseNumber str(_playerMoney)) then {hint format["You don't have enought money for %1", _itemText];_handleMoney = 0;breakTo "main"};				
				_class = _x select 1;				
				_dir = getdir player;
				_vehPos = getPos player;
				_Dospawn = 0;				
				_vehPos =(getMarkerPos format ["sea_spawn_%1", currentOwnerID]);
				_DoSpawn = 1;
				_veh_type = _class;
				_old_veh = nearestObjects [_vehPos, ["AllVehicles"], 5];
				{deleteVehicle _x} forEach _old_veh;
				if(_Dospawn == 1) then{ [_car, _colorText, _veh_type, _vehPos] call _applyVehProperties; };
			};
		}forEach submarinesArray;
	};
};

if(_handleMoney ==1) then
{
	hint format["%1 spawned outside.", _itemText];
	player setVariable[__MONEY_VAR_NAME__,_playerMoney - _price,true];
	_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable __MONEY_VAR_NAME__];
};
