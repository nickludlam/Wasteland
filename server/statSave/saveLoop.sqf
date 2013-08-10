#include "defines.hpp"
// Usage: ["myDatabaseFile", "SicSemperTyrannis", "position", position player] call iniDB_write;
// Usage: ["myDatabaseFile", "SicSemperTyrannis", "health", 100.0] call iniDB_write;
// Usage: ["myDatabaseFile", "SicSemperTyrannis", "name", profileName player] call iniDB_write;
Sleep 60;
Diag_Log Format["SaveLoop Started at %1", Time];
while {true} do 
{	
private ["_uid","_PlayerArray","_SaveOK","_x","_FilteredArray"];

	_PlayerArray = PlayableUnits;
	Diag_Log Format ["_PlayerArray is %1",_PlayerArray];
	{
		_uid = getPlayerUID _x;
			//Check the save variable from the player, to make sure they're not in combat, or otherwise blocked from saving.
			_SaveOK = _x GetVariable "SaveOK";
			If (_SaveOK == 1) Then 
			{
				Diag_Log Format["Processing Player %1", _x];
				[_UID, _UID, "Account Name", name _x] call fn_SaveToServer;
				[_UID, _UID, "Money", _x getVariable __MONEY_VAR_NAME__] call fn_SaveToServer;
				[_UID, _UID, "Health", damage _x] call fn_SaveToServer;
				[_UID, _UID, "Side", str(side _x)] call fn_SaveToServer;
				[_UID, _UID, "CanFood", _x getVariable "canfood"] call fn_SaveToServer;
				[_UID, _UID, "Medkits", _x getVariable "medkits"] call fn_SaveToServer;
				[_UID, _UID, "Water", _x getVariable "water"] call fn_SaveToServer;
				[_UID, _UID, "Fuel", _x getVariable "fuel"] call fn_SaveToServer;
				[_UID, _UID, "RepairKits", _x getVariable "repairkits"] call fn_SaveToServer;
				[_UID, _UID, "FuelFull", _x getVariable "fuelFull"] call fn_SaveToServer;
				[_UID, _UID, "FuelEmpty", _x getVariable "fuelEmpty"] call fn_SaveToServer;
				[_UID, _UID, "SpawnBeacon", _x getVariable "spawnBeacon"] call fn_SaveToServer;
				[_UID, _UID, "Camonet", _x getVariable "camonet"] call fn_SaveToServer;
				[_UID, _UID, "Outfit", uniform _x] call fn_SaveToServer;
				[_UID, _UID, "Vest", vest _x] call fn_SaveToServer;
				[_UID, _UID, "HeadGear", headGear _x] call fn_SaveToServer;
				[_UID, _UID, "Backpack", backpack _x] call fn_SaveToServer;
				[_UID, _UID, "Items", items _x] call fn_SaveToServer;
				[_UID, _UID, "Weapons", Weapons _x] call fn_SaveToServer;
				[_UID, _UID, "Magazines", Magazines _x] call fn_SaveToServer;
				[_UID, _UID, "SecondaryWeapon", SecondaryWeapon _x] call fn_SaveToServer;
				[_UID, _UID, "Position", getPosATL vehicle _x] call fn_SaveToServer;
				[_UID, _UID, "Direction", direction vehicle _x] call fn_SaveToServer;
				[_UID, _UID, "Goggles", goggles _x] call fn_SaveToServer;
				[_UID, _UID, "SecondaryItems", secondaryWeaponItems _x] call fn_SaveToServer;
				[_UID, _UID, "HandgunItems", handgunItems _x] call fn_SaveToServer;
				[_UID, _UID, "PrimaryItems", primaryWeaponItems _x] call fn_SaveToServer;
				[_UID, _UID, "PrimaryMagazine", primaryWeaponMagazine _x] call fn_SaveToServer;
				[_UID, _UID, "SecondaryMagazine", secondaryWeaponMagazine _x] call fn_SaveToServer;
				[_UID, _UID, "HandgunMagazine", handgunMagazine _x] call fn_SaveToServer;
				
			};
			Sleep 0.25;	
	} ForEach _PlayerArray;
	Sleep 3;
	
};