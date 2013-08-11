#include "defines.hpp"
private["_uid"];
if(str(playerSetupComplete) == "true") then
{	
	_uid = getPlayerUID player;
	[_uid, _uid, "Account Name", name player] call fn_SaveToServer;
	[_uid, _uid, "Money", player getVariable __MONEY_VAR_NAME__] call fn_SaveToServer;
	[_uid, _uid, "Health", damage player] call fn_SaveToServer;
	[_uid, _uid, "Side", str(side player)] call fn_SaveToServer;
	[_uid, _uid, "CanFood", player getVariable "canfood"] call fn_SaveToServer;
	[_uid, _uid, "Medkits", player getVariable "medkits"] call fn_SaveToServer;
	[_uid, _uid, "Water", player getVariable "water"] call fn_SaveToServer;
	[_uid, _uid, "Fuel", player getVariable "fuel"] call fn_SaveToServer;
	[_uid, _uid, "RepairKits", player getVariable "repairkits"] call fn_SaveToServer;
	[_uid, _uid, "FuelFull", player getVariable "fuelFull"] call fn_SaveToServer;
	[_uid, _uid, "FuelEmpty", player getVariable "fuelEmpty"] call fn_SaveToServer;
	[_uid, _uid, "SpawnBeacon", player getVariable "spawnBeacon"] call fn_SaveToServer;
	[_uid, _uid, "Camonet", player getVariable "camonet"] call fn_SaveToServer;
	[_uid, _uid, "Outfit", uniform player] call fn_SaveToServer;
	[_uid, _uid, "Vest", vest player] call fn_SaveToServer;
	[_uid, _uid, "HeadGear", headGear player] call fn_SaveToServer;
	[_uid, _uid, "Backpack", backpack player] call fn_SaveToServer;
	[_uid, _uid, "Items", items player] call fn_SaveToServer;
	[_uid, _uid, "Weapons", Weapons player] call fn_SaveToServer;
	[_uid, _uid, "Magazines", Magazines player] call fn_SaveToServer;
	[_uid, _uid, "SecondaryWeapon", SecondaryWeapon player] call fn_SaveToServer;
	[_uid, _uid, "Position", getPosATL vehicle player] call fn_SaveToServer;
	[_uid, _uid, "Direction", direction vehicle player] call fn_SaveToServer;
	[_uid, _uid, "Goggles", goggles player] call fn_SaveToServer;
	[_uid, _uid, "SecondaryItems", secondaryWeaponItems player] call fn_SaveToServer;
	[_uid, _uid, "HandgunItems", handgunItems player] call fn_SaveToServer;
	[_uid, _uid, "PrimaryItems", primaryWeaponItems player] call fn_SaveToServer;
	[_uid, _uid, "PrimaryMagazine", primaryWeaponMagazine player] call fn_SaveToServer;
	[_uid, _uid, "SecondaryMagazine", secondaryWeaponMagazine player] call fn_SaveToServer;
	[_uid, _uid, "HandgunMagazine", handgunMagazine player] call fn_SaveToServer;
	player globalChat "Player Saved...";
};