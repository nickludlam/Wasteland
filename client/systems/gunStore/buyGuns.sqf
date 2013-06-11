
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
if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

private ["_name"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_exe = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;

switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;
			//0 = Primary, 1 = SideArm, 2= Secondary, 3= HandGun Mags, 4= MainGun Mags, 5= Binocular, 7=Compass Slots
			_playerSlots = [player] call BIS_fnc_invSlotsEmpty;
			
			{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_weapon = (configFile >> "cfgWeapons" >> _class);
					_type = getNumber(_weapon >> "type");
					
					//Main Rifle
					if(_type == 1) then
					{
						player addWeapon _class;
					};
					
					//Side Arm
					if(_type == 2) then
					{
						player addWeapon _class;
					};
					
					//Rocket Launcher
					if(_type == 4) then
					{
						player addWeapon _class;
					};
					
					//LMG
					if(_type == 5) then
					{
						player addWeapon _class;
					};
				};                    		
			}forEach weaponsArray;
			
			{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_dir = getdir player;
					_vehPos = getPos player;
					_Dospawn = 0;
					_vehPos =(getMarkerPos format ["veh_spawn_%1", currentOwnerID]);
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
						_color = _x select 4;
						if(_color == "orange") then {_car setObjectTexture [0, "fack.jpg"];};
						if(_color == "red") then {_car setObjectTexture [0, "deser.jpg"];};
						if(_color == "yellow") then {_car setObjectTexture [0, "fuel.jpg"];};
						if(_color == "pink") then {_car setObjectTexture [0, "pank.jpg"];};
						
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
						_color = _x select 4;
						if(_color == "orange") then {_car setObjectTexture [0, "fack.jpg"];};
						if(_color == "red") then {_car setObjectTexture [0, "deser.jpg"];};
						if(_color == "yellow") then {_car setObjectTexture [0, "fuel.jpg"];};
						if(_color == "pink") then {_car setObjectTexture [0, "pank.jpg"];};
						
						//enable vehicle locking
						vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
						_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
						_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
					};
				};
			}forEach seaArray;
			
						{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_dir = getdir player;
					_vehPos = getPos player;
					_Dospawn = 0;
					_vehPos =(getMarkerPos format ["veh_spawn_%1", currentOwnerID]);
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
						_color = _x select 4;
						if(_color == "orange") then {_car setObjectTexture [0, "fack.jpg"];};
						if(_color == "red") then {_car setObjectTexture [0, "deser.jpg"];};
						if(_color == "yellow") then {_car setObjectTexture [0, "fuel.jpg"];};
						if(_color == "pink") then {_car setObjectTexture [0, "pank.jpg"];};
						
						//enable vehicle locking
						vehiclelock = _car addAction ["Unlock / Lock","server\functions\unlocklock.sqf",[],7,true,true,"","(_target distance _this) < 7"];
						_car addEventHandler ["Killed",{(_this select 0) spawn {sleep 180; deleteVehicle _this}}];
						_car addEventHandler ["IncomingMissile", "hint format['Incoming Missile Launched By: %1', name (_this select 2)]"];
					};
				};
			}forEach airArray;

			{
				if(_itemText == _x select 0) then
				{
					_class = _x select 1;
					_name = _x select 1;
					_mag = (configFile >> "cfgMagazines" >> _class);
					_type = (getNumber(_mag >> "type"));
					_exe = [player, _class] call fn_fitsInventory;					
					if(_exe == 0) then
					{
						{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach ammoArray;
						gunStoreCart = gunStoreCart - _price;
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

			{
                if(_itemText == _x select 0) then
                {
                    _class = _x select 1;
					switch((_x select 3)) do
                    {
                    	case "binoc":
                        {
                            if((_playerSlots select 5) >= 1) then
							{
								player addWeapon _class;
							}
							else
							{
								{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach apparelArray;
								gunStoreCart = gunStoreCart - _price;
								hint format["You do not have space for this item %1",_name];
							};
                        };
                        case "item":
                        {
                            player addItem _class;
                        };
                        case "vest":
                        {
                            _vestName = vest player;

							removeVest player;
                            player addVest _class;
                        };
						case "backpack":
						{
							_backpackName = backpack player;

							removeBackpack player;
							player addBackpack _class;
						};
                        case "uni":
                        {
                            _vestName = uniform player;
							removeUniform player;
                            player addUniform _class;
                        };
                        case "hat":
                        {
                            _vestName = headgear player;
							removeHeadgear player;
                            player addHeadgear _class;
                        };
                        case "gogg":
                        {
                            _vestName = goggles player;
                            removeGoggles player;
                            player addgoggles _class;
                        };
                        case default
                        {
                            
                        };
                    };
				};
            }forEach accessoriesArray;
			
			
			{
                if(_itemText == _x select 0) then
                {
                    _class = _x select 1;
					switch((_x select 3)) do
                    {
                    	case "binoc":
                        {
                            if((_playerSlots select 5) >= 1) then
							{
								player addWeapon _class;
							}
							else
							{
								{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach apparelArray;
								gunStoreCart = gunStoreCart - _price;
								hint format["You do not have space for this item %1",_name];
							};
                        };
                        case "item":
                        {
                            player addItem _class;
                        };
                        case "vest":
                        {
                            _vestName = vest player;

			   removeVest player;
                            player addVest _class;
                        };
			case "backpack":
			{
			_backpackName = backpack player;

			removeBackpack player;
			player addBackpack _class;
			};
                        case "uni":
                        {
                            _vestName = uniform player;
							removeUniform player;
                            player addUniform _class;
                        };
                        case "hat":
                        {
                            _vestName = headgear player;
			    removeHeadgear player;
                            player addHeadgear _class;
                        };
			case "gogg":
                        {
                            _vestName = goggles player;
                            removeGoggles player;
                            player addgoggles _class;
                        };
                        case default
                        {
                            
                        };
                    };
				};
            }forEach apparelArray;
			
			{
                if(_itemText == _x select 0) then
                {
                    _class = _x select 1;
					switch((_x select 3)) do
                    {
                    	case "binoc":
                        {
                            if((_playerSlots select 5) >= 1) then
							{
								player addWeapon _class;
							}
							else
							{
								{if(_x select 1 == _class) then{_price = _x select 2; _name = _x select 0;};}forEach backpackArray;
								gunStoreCart = gunStoreCart - _price;
								hint format["You do not have space for this item %1",_name];
							};
                        };
                        case "item":
                        {
                            player addItem _class;
                        };
                        case "vest":
                        {
                            _vestName = vest player;

							removeVest player;
                            player addVest _class;
                        };
						case "backpack":
						{
							_backpackName = backpack player;

							removeBackpack player;
							player addBackpack _class;
						};
                        case "uni":
                        {
                            _vestName = uniform player;
							removeUniform player;
                            player addUniform _class;
                        };
                        case "hat":
                        {
                            _vestName = headgear player;
							removeHeadgear player;
                            player addHeadgear _class;
                        };
                        case default
                        {
                            
                        };
                    };
				};
            }forEach backpackArray;
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,true];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};
