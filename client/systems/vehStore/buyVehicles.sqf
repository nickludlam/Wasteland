
//	@file Version: 1.0
//	@file Name: buyVehicles.sqf
//	@file Author: His_Shadow
//	@file Created: 06/14/2013 05:13

#include "dialog\vehstoreDefines.sqf";
//#include "addons\proving_ground\defs.hpp"
#define GET_DISPLAY (findDisplay balca_debug_VC_IDD)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
disableSerialization;

private ["_name"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_price = 0;

// Grab access to the controls
_dialog = findDisplay vehshop_DIALOG;
_playerMoneyText = _Dialog displayCtrl vehshop_money;
_colorText = lbText [vehshop_color_list, (lbCurSel vehshop_color_list)];
_itemText = lbText  [vehshop_veh_list, (lbCurSel vehshop_veh_list)];
_handleMoney = 1;

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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
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
				if(_Dospawn == 1) then
				{
					_car = createVehicle [_veh_type,_vehPos, [], 0, "CAN_COLLIDE"];
	
					//_veh setDir _dir;
					_car setVariable ["newVehicle",1,true];
					_car setVelocity [0,0,0];
					
					//if they chose a color set the color
					//if they chose a color set the color
					if(_colorText == "Orange Camo") then {_car setObjectTexture [0, "images\camo_fack.jpg"];};
					if(_colorText == "Red Camo") then {_car setObjectTexture [0, "images\camo_deser.jpg"];};
					if(_colorText == "Yellow Camo") then {_car setObjectTexture [0, "images\camo_fuel.jpg"];};
					if(_colorText == "Pink Camo") then {_car setObjectTexture [0, "images\camo_pank.jpg"];};
					
					//enable vehicle locking
					vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
					_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
					_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
				};
			};
		}forEach submarinesArray;
	};
};
if(_handleMoney ==1) then
{
	hint format["%1 spawned outside.", _itemText];
	player setVariable["cmoney",_playerMoney - _price,true];
	_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
};
