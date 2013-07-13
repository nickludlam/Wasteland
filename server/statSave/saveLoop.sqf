#include "defines.hpp"

//waitUntil {statsLoaded == 1;};
//while {true} do
//{
	//sleep 120;
	//player globalChat format["Setup Complete: %1", playerSetupComplete];
	if(str(playerSetupComplete) == "true") then
	{
		[getPlayerUID player, getPlayerUID player, "Account Name", name player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Money", player getVariable __MONEY_VAR_NAME__] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Health", damage player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Side", str(side player)] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "CanFood", player getVariable "canfood"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Medkits", player getVariable "medkits"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Water", player getVariable "water"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Fuel", player getVariable "fuel"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "RepairKits", player getVariable "repairkits"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "FuelFull", player getVariable "fuelFull"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "FuelEmpty", player getVariable "fuelEmpty"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "SpawnBeacon", player getVariable "spawnBeacon"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Camonet", player getVariable "camonet"] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Outfit", uniform player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Vest", vest player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "HeadGear", headGear player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Backpack", backpack player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Items", items player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Weapons", Weapons player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Magazines", Magazines player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "SecondaryWeapon", SecondaryWeapon player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Position", getPosATL vehicle player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Direction", direction vehicle player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "Goggles", goggles player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "SecondaryItems", secondaryWeaponItems player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "HandgunItems", handgunItems player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "PrimaryItems", primaryWeaponItems player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "PrimaryMagazine", primaryWeaponMagazine player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "SecondaryMagazine", secondaryWeaponMagazine player] call fn_SaveToServer;
		[getPlayerUID player, getPlayerUID player, "HandgunMagazine", handgunMagazine player] call fn_SaveToServer;
	player globalChat "Player Saved...";
	};
//};